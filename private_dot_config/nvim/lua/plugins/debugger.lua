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
      dapgo.setup()

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
        ensure_installed = { "python", "delve" }
      })
    end
  }
}
