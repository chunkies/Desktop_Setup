return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local nvim_treesitter_config = require("nvim-treesitter.configs")
			local keymaps = require("core.keymaps")

			nvim_treesitter_config.setup({
				ensure_installed = {
					"typescript",
					"javascript",
					"html",
					"css",
					"c_sharp",
					"go",
					"tsx",
					"json",
					"gitignore",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"lua",
					"powershell",
					"regex",
					"sql",
					"tmux",
					"yaml",
					"xml",
					"cpp",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = keymaps.treesitter_keymaps.inner_around,
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = keymaps.treesitter_keymaps.goto_next_start,
						goto_previous_start = keymaps.treesitter_keymaps.goto_previous_start,
					},
				},
			})
		end,
	},
}
