return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "tsserver" }, -- pick your servers
      })

      local lspconfig = require("lspconfig")

      -- Example: Lua
      lspconfig.lua_ls.setup({})

      -- Example: Python
      lspconfig.pyright.setup({})

      -- Example: JavaScript/TypeScript
      lspconfig.ts_ls.setup({})
    end
  }
}
