return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
          require("mason").setup {

          }
        end,
      },
      "neovim/nvim-lspconfig",
    },
    config = function()
      local lspconfig = require("mason-lspconfig")

      lspconfig.setup({
        ensure_installed = {
          "ts_ls",
          "lua_ls",
          "omnisharp"
        },
        automatic_installation = true,
      })
    end
  }
}
