return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    },
    dependencies = {
      { "mfussenegger/nvim-dap" },
      { "jay-babu/mason-nvim-dap.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
      { "mason-org/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_nvim_dap = require("mason-nvim-dap")
      local mason_null_ls = require("mason-null-ls")

      mason.setup()

      mason_nvim_dap.setup({
        ensure_installed = {
          "python",
          "delve",
          "netcoredbg"
        }
      })

      mason_lspconfig.setup {
        automatic_enable = true,
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "ts_ls",
          "omnisharp",
          "gopls",
          "bashls",
        },
      }


      mason_null_ls.setup({
        ensure_installed = {
          "prettier",  -- JS/TS/React
          "eslint_d",  -- JS/TS/React
          "csharpier", -- C#
          "sql-formatter",
          "beautysh"
        },
      })
    end,
  }
}
