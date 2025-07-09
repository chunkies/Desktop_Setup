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
      { "mason-org/mason-lspconfig.nvim" },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_nvim_dap = require("mason-nvim-dap")

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
          "gopls"
        },
      }
    end,
  }
}
