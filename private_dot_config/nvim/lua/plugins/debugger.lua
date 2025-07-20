return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim"
    },
    config = function()
      local dapui = require("dapui")
      local dapgo = require("dap-go")
      local dap = require("dap")
      local mason_nvim_dap = require("mason-nvim-dap")

      mason_nvim_dap.setup({
        ensure_installed = {
          "python",
          "delve",
          "netcoredbg"
        }
      })

      vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })

      dapui.setup()

      --go setup
      dapgo.setup()

      --dotnet setup
      dap.adapters.coreclr = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/packages/netcoredbg/netcoredbg',
        args = { '--interpreter=vscode' }
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            local build_info = require('utils.dotnet_dap').get_dotnet_build_info()
            print("Running dotnet build...")
            os.execute("dotnet build " .. build_info.csproj)
            print("Using framework: " .. build_info.framework)
            print("Assembly name: " .. build_info.assembly)
            print("Output path: " .. build_info.outputPath)
            print("Executable: " .. build_info.exePath)
            return build_info.exePath
          end,
        },
      }

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

}
