return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local dashboard = require("dashboard")

      dashboard.setup {
        theme = "hyper",
        config = {

          packages = { enable = true },

          week_header = {
            enable = true,
          },

          center = {
            {
              icon = "󰈞  ",
              desc = " Find File                     ",
              key = "f",
              action = "Telescope find_files"
            },
            {
              icon = "󰈚  ",
              desc = " Recent Files                  ",
              key = "r",
              action = "Telescope oldfiles"
            },
            {
              icon = "󰈭  ",
              desc = " Find Word                     ",
              key = "w",
              action = "Telescope live_grep"
            },
            {
              icon = "  ",
              desc = " Config                        ",
              key = "c",
              action = "e $MYVIMRC"
            },
            {
              icon = "󰗼  ",
              desc = " Quit                          ",
              key = "q",
              action = "qa"
            },
          },

          footer = {
            "",
            "🚀  Hack the Planet!",
            "https://neovim.io",
          },

          vertical_center = true,
        }
      }
    end,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
      { 'MaximilianLloyd/ascii.nvim' },
    }
  }
}
