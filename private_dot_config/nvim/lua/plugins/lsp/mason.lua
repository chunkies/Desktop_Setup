return {
  {
    "mason-org/mason.nvim",
    opts = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    },
    config = function(_, opts)
      local mason = require("mason")
      mason.setup(opts) {

      }
    end,
  },
}
