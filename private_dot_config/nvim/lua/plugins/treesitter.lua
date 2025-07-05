return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "typescript",
          "javascript",
          "html",
          "css",
          "c_sharp",
          "tsx",
          "json",
          "gitignore",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "lua",
          "powershell",
          "regex",
          "sql",
          "tmux",
          "yaml",
          "xml"
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
      })

      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true,          -- Auto close tags
          enable_rename = true,         -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        },
      })
    end,
  }
}
