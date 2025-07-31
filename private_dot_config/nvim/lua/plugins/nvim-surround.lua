return {
	"kylechui/nvim-surround",
	version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		local keymaps = require("core.keymaps")
		require("nvim-surround").setup({
			keymaps = keymaps.nvimSurround_keymaps,
		})
	end,
}
