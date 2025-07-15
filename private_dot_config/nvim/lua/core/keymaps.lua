local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local M = {}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move between windows using Ctrl + Arrow Keys
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Right>", "<C-w>l", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Up>", "<C-w>k", opts)

-- Resize splits with Ctrl + Alt + Arrow
map("n", "<C-A-Up>", ":resize +2<CR>", opts)
map("n", "<C-A-Down>", ":resize -2<CR>", opts)
map("n", "<C-A-Right>", ":vertical resize +2<CR>", opts)
map("n", "<C-A-Left>", ":vertical resize -2<CR>", opts)

-- save
map({ "i", "v", "n" }, "<C-s>", "<cmd>w<cr>", opts)

-- file explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
map("n", "<leader>fp", ":Telescope project<CR>", opts)
map('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { desc = 'Telescope find files' })
map('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", { desc = 'Telescope live grep' })
map('n', '<leader>fb', "<cmd>Telescope buffers<cr>", { desc = 'Telescope buffers' })
map('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", { desc = 'Telescope help tags' })

-- Debugger
map("n", "<leader>b", ":DapToggleBreakpoint<CR>", opts)
map("n", "<leader>c", ":DapContinue<CR>", opts)
map("n", "<leader>x", ":DapTerminate<CR>", opts)
map("n", "<leader>o", ":DapStepOver<CR>", opts)

-- Normal
map('n', '<A-Up>', ':m .-2<CR>==', opts)
map('n', '<A-Down>', ':m .+1<CR>==', opts)

-- Visual
map('v', '<A-Up>', ":m '<-2<CR>gv=gv", opts)
map('v', '<A-Down>', ":m '>+1<CR>gv=gv", opts)

-- Jump back/forward in jumplist
map("n", "<A-Left>", "<C-o>", opts)
map("n", "<A-Right>", "<C-i>", opts)

--LSP keymaps
function M.lsp()
  map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=8<CR>", opts)
  map("n", "<leader>d", vim.diagnostic.open_float, opts)
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
end

--rename
map('n', '<leader>rn', function()
  vim.lsp.buf.rename()
end, opts)

--Auto format
map('n', '<A-F>', function()
  vim.lsp.buf.format({ async = false })
end, opts)

-- F12 to go to definition
map("n", "<F12>", function()
  vim.lsp.buf.definition()
end, opts)

return M
