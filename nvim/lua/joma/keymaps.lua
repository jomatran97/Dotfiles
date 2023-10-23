local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move window
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-l>', '<C-w>l', opts)


-- Indent mode
keymap("v", "<S-Tab>", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)

-- Resize window
keymap('n', '[', '<C-w><', opts)
keymap('n', ']', '<C-w>>', opts)
keymap('n', '<C-w><up>', '<C-w>+', opts)
keymap('n', '<C-w><down>', '<C-w>-', opts)


-- Toggle relative number
keymap("n", "<leader>r", "<cmd>set relativenumber!<cr>", opts)
keymap("v", "<leader>r", "<cmd>set relativenumber!<cr>", opts)

-- New tab
keymap('n', 'te', ':tabedit ', opts)

-- Split window
keymap('n', 'sh', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Increment/decrement
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- harpoon
keymap('n', '<C-n>', "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap('n', '<C-p>', "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)

