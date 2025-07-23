return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-t>]],
				hide_numbers = true,
				direction = "float",
				float_opts = {
					border = "curved",
				},
				start_in_insert = true,
				autochdir = true,
			})
		end,
	},
}
