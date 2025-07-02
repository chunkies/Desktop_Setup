return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    -- Set custom highlight for current indent scope
    vim.api.nvim_set_hl(0, "IndentScope", { fg = "#7aa2f7", nocombine = true })
  end,
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      highlight = { "IndentScope" },
    },
    exclude = {
      filetypes = { "help", "terminal", "lazy", "lspinfo", "TelescopePrompt" },
    },
  },
}

