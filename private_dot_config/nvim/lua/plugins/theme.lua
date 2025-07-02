return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,        -- load on startup
  priority = 1000,     -- load before other plugins
  opts = {
    flavour = "mocha", -- or latte, frappe, macchiato
    transparent_background = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      telescope = {
        enabled = true,
      },
    },
  },

  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
