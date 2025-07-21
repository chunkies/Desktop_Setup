return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason-org/mason.nvim" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					rust = { "rustfmt" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					cs = nil,
					sh = { "shfmt" },
					bash = { "beautysh" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = "fallback",
				},
			})
		end,
	},

	-- Mason‑Conform — should load *after* both Mason and Conform
	{
		"zapling/mason-conform.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"stevearc/conform.nvim",
		},
		opts = {},
		config = function()
			require("mason-conform").setup({
				automatic_installation = true,
				quiet_mode = false,
			})
		end,
	},
}
