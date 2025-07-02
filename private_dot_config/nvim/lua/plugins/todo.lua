return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        TODO = { icon = "", color = "info" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "HACK" } },
        PERF = { icon = " ", color = "error", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "󰎚 ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        gui_style = {
          fg = "NONE", -- The gui style to use for the fg highlight group.
          bg = "BOLD", -- The gui style to use for the bg highlight group.
        },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" }
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        }
      }
    }
  }
}

-- TODO: TEST
-- WARN: TEST
-- PERF: TEST
-- NOTE: TEST
-- TEST: TEST
