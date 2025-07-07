return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvim_tree = require("nvim-tree")
    nvim_tree.setup({
      update_focused_file = {
        enable = true,
        update_root = false,
      }
    })
  end,
}
