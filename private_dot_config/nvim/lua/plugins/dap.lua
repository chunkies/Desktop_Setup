return {

  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- Configure adapters here if needed
    end,
  },

  -- Mason DAP integration
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap", "williamboman/mason.nvim" },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "coreclr", -- .NET (C#) debugger
          "chrome",  -- JS/TS debugging via Chrome
        },
        automatic_installation = true,
      })
    end,
  },

  -- Omnisharp extended support (needed for go-to-definition etc.)
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
}
