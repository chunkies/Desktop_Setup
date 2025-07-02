return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
}
