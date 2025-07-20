return {
  -- Formatters & Linters (null-ls)
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "jay-babu/mason-null-ls.nvim" },
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics


      require("mason-null-ls").setup({
        ensure_installed = {
          "prettier",  -- JS/TS/React
          "eslint_d",  -- JS/TS/React
          "csharpier", -- C#
          "sql-formatter"
        },
        automatic_installation = true,
      })

      null_ls.setup({
        sources = {
          -- JS/TS/React
          formatting.prettier.with({
            filetypes = {
              "javascript", "javascriptreact",
              "typescript", "typescriptreact",
              "css", "html", "json", "yaml", "markdown"
            },
          }),
          diagnostics.eslint_d,
          formatting.csharpier,

          -- SQL
          formatting.sql_formatter,

          -- Shell scripts
          formatting.beautysh,
        },
      })
    end,
  },
}
