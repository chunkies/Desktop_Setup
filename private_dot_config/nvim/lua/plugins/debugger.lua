return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dapui = require("dapui")
      local dapgo = require("dap-go")
      local dap = require("dap")

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
            --1. Build the project
            print("Building the project")
            os.execute("dotnet build")


            --2. Find the Framework
            local framework = nil
            for line in io.popen('grep -m1 "<TargetFramework" *.csproj'):lines() do
              framework = line:match("<TargetFramework>(.*)</TargetFramework>")
            end

            if not framework then
              error("Could not determine TargetFramework. Please check your .csproj.")
            end


            -- 3. Find the DLL name
            local dllName = nil
            for file in io.popen('ls *.csproj'):lines() do
              dllName = file:gsub("%.csproj$", ".dll")
            end

            if not dllName then
              error("Could not determine DLL name from .csproj.")
            end


            -- 4. Build the full path
            local cwd = vim.fn.getcwd()
            local path = cwd .. "/bin/Debug/" .. framework .. "/" .. dllName

            print("Launching: " .. path)
            return path
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

      vim.keymap.set("n", "<leader>t", ":DapToggleBreakpoint<CR>")
      vim.keymap.set("n", "<leader>c", ":DapContinue<CR>")
      vim.keymap.set("n", "<leader>x", ":DapTerminate<CR>")
      vim.keymap.set("n", "<leader>o", ":DapStepOver<CR>")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "delve", "netcoredbg" }
      })
    end
  }
}
