local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Move between windows using Ctrl + Arrow Keys
vim.keymap.set("n", "<C-Left>", "<C-w>h", opts)
vim.keymap.set("n", "<C-Right>", "<C-w>l", opts)
vim.keymap.set("n", "<C-Down>", "<C-w>j", opts)
vim.keymap.set("n", "<C-Up>", "<C-w>k", opts)

--select all
vim.keymap.set("n", "<C-a>", function()
  vim.cmd("normal! ggVG")
end, opts)

-- save auto format
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", opts)
vim.keymap.set("i", "<C-s>", "<cmd>w<cr>", opts)
vim.keymap.set("v", "<C-s>", "<cmd>w<cr>", opts)

--force quit
vim.keymap.set("n", "<C-w>", "<cmd>wq<cr>", opts)

-- file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
