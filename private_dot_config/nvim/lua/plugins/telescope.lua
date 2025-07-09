return {
  {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      'nvim-telescope/telescope-project.nvim',
    },
    config = function()
      local project_actions = require("telescope._extensions.project.actions")
      local telescope = require('telescope')

      telescope.setup {
        extensions = {
          project = {
            ignore_missing_dirs = true,
            hidden_files = true,
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true,
            on_project_selected = function(prompt_bufnr)
              project_actions.change_working_directory(prompt_bufnr, false)
            end,
          },
        },
      }

      telescope.load_extension('project')
    end,
  },
}
