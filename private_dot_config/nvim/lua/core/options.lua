-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Number of spaces per <Tab>
vim.opt.tabstop = 2

-- Number of spaces for each level of indentation
vim.opt.shiftwidth = 2

-- Number of spaces Neovim uses for autoindent (when pressing Enter)
vim.opt.softtabstop = 2

-- Enable auto-indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Show trailing whitespace, tabs, etc.
vim.opt.list = false

vim.opt.updatetime = 300

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
