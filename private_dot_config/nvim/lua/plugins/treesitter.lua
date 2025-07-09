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
          "go",
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
        }
      })
    end,
  }
}
