return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      { "neovim/nvim-lspconfig" }
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup {
        automatic_enable = true,
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "ts_ls",
          "omnisharp",
          "gopls"
        },
      }
    end,
  }
}
