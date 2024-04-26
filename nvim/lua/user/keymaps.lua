local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Toggle relative number
keymap("n", "<leader>r", "<cmd>set relativenumber!<cr>", opts)
keymap("v", "<leader>r", "<cmd>set relativenumber!<cr>", opts)

-- disable highlight search
keymap ("n", "<leader>n", "<cmd>nohl<cr>",opts)

-- New tab
keymap('n', 'te', ':tabedit ', opts)

-- Split window
keymap('n', 'aj', ':split<Return><C-w>w', opts)
keymap('n', 'al', ':vsplit<Return><C-w>w', opts)


-- Resize window
keymap('n', '[', '<C-w><', opts)
keymap('n', ']', '<C-w>>', opts)
