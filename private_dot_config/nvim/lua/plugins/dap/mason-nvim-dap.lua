return {
  {
    "mason-org/mason.nvim", -- wrong path
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",

    config = function()
      local mason = require("mason")
      local mason_nvim_dap = require("mason-nvim-dap")

      mason.setup({

      })

      mason_nvim_dap.setup({
        ensure_installed = { "python", "delve" },
        handlers = {
          function(config)
            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
          end,

          -- python dap
          python = function(config)
            config.adapters = {
              type = "executable",
              command = "/usr/bin/python3",
              args = {
                "-m",
                "debugpy.adapter",
              },
            }
            require('mason-nvim-dap').default_setup(config) -- don't forget this!
          end,

        },
      })
    end
  }
}
