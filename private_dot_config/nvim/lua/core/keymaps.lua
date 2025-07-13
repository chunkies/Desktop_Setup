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

--select all
map("n", "<C-a>", "ggVG", opts)

-- save auto format
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

--Auto format
map('n', '<A-F>', function()
  vim.lsp.buf.format({ async = false })
end, opts)

--LSP keymaps
function M.lsp(bufnr)
  local buffer_opts = vim.tbl_extend("force", opts, { buffer = bufnr })

  map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=8<CR>", opts)
  map("n", "<leader>d", vim.diagnostic.open_float, opts)
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
  map("n", "K", vim.lsp.buf.hover, opts)

  map('n', '<A-F>', function()
    vim.lsp.buf.format({ async = false })
  end, buffer_opts)
end

return M
