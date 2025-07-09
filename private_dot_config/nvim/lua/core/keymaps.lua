local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Move between windows using Ctrl + Arrow Keys
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Right>", "<C-w>l", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Up>", "<C-w>k", opts)

--select all
map("n", "<C-a>", "<cmd>ggVG<cr>", opts)

-- save auto format
map("n", "<C-s>", "<cmd>w<cr>", opts)
map("i", "<C-s>", "<cmd>w<cr>", opts)
map("v", "<C-s>", "<cmd>w<cr>", opts)

--force quit
map("n", "<C-w>", "<cmd>wq<cr>", opts)

-- file explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)


-- Telescope
map("n", "<C-p>", ":Telescope project<CR>", opts)
map("n", "<space><space>", "<cmd>Telescope find_files<cr>", { desc = "Find files (Telescope)" })

-- Debugger
map("n", "<leader>b", ":DapToggleBreakpoint<CR>", opts)
map("n", "<leader>c", ":DapContinue<CR>", opts)
map("n", "<leader>x", ":DapTerminate<CR>", opts)
map("n", "<leader>o", ":DapStepOver<CR>", opts)


-- Set up LSP keymaps
map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
map("n", "<leader>d", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "K", vim.lsp.buf.hover, opts)



-- Move current line up and down in Normal mode
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })

-- Move selected lines up and down in Visual mode
vim.api.nvim_set_keymap('v', '<A-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Move current line up and down
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Move selected lines up and down
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
