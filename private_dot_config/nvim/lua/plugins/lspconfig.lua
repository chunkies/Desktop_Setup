return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		require("mason").setup()

		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		mason_lspconfig.setup({
			automatic_enable = true,
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"ts_ls",
				"omnisharp",
				"gopls",
				"bashls",
			},
		})

		local function on_attach(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local keymaps = require("core.keymaps")
			keymaps.lsp(bufnr)

			if client.supports_method("textDocument/codeAction") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.code_action({
							context = { only = { "source.organizeImports", "source.addMissingImports" } },
							apply = true,
						})
					end,
				})
			end
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup({
			handlers = {
				function(server_name) -- default handler
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								completion = { callSnippet = "Replace" },
							},
						},
					})
				end,
				["omnisharp"] = function()
					lspconfig.omnisharp.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						handlers = {},
						settings = {
							FormattingOptions = { EnableEditorConfigSupport = true },
							MsBuild = {},
							RenameOptions = {},
							RoslynExtensionsOptions = {},
							Sdk = { IncludePrereleases = true },
							omnisharp = {
								enableImportCompletion = true,
							},
						},
					})
				end,
				["gopls"] = function()
					lspconfig.gopls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						filetypes = { "go" },
					})
				end,
				["ts_ls"] = function()
					lspconfig.tsserver.setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				["bashls"] = function()
					lspconfig.bashls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
			},
		})
	end,
}
