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

-- select all
map({ "v", "n" }, "<C-a>", "ggVG", opts)

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
  -- Diagnostics
  map("n", "[d", vim.diagnostic.goto_prev, opts, { desc = "Previous diagnostic" })
  map("n", "]d", vim.diagnostic.goto_next, opts, { desc = "Next diagnostic" })

  -- Hover docs and signature
  map("n", "K", vim.lsp.buf.hover, opts, { desc = "Show hover/type info" })
end

--rename
map('n', '<leader>rr', function()
  vim.lsp.buf.rename()
end, opts)

--Auto format
map('n', '<A-F>', function()
  vim.lsp.buf.format({ async = false })
end, opts)

-- go to definition
map("n", "gd", function()
  vim.lsp.buf.definition()
end, opts)

-- go to definition
map("n", "gi", function()
  vim.lsp.buf.implementation()
end, opts)

-- go to definition
map("n", "gt", function()
  vim.lsp.buf.definition()
end, opts)

M.treesitter_keymaps = {
  inner_around = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",

    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",

    ["aa"] = "@parameter.outer",
    ["ia"] = "@parameter.inner",
  },
  goto_next_start = {
    [']f'] = '@function.outer',
    [']c'] = '@class.outer',
    [']a'] = '@parameter.outer',
  },
  goto_previous_start = {
    ['[f'] = '@function.outer',
    ['[c'] = '@class.outer',
    ['[a'] = '@parameter.outer',
  },
}

return M
