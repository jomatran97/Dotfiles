local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Delete without yanking
keymap('n', 'd', '"_d', opts)
keymap('v', 'd', '"_d', opts)

-- Change without yanking
keymap('n', 'c', '"_c', opts)
keymap('v', 'c', '"_c', opts)

-- Use x to delete character without yanking
keymap('n', 'x', '"_x', opts)
keymap('v', 'x', '"_x', opts)

-- Use X to delete character before cursor without yanking
keymap('n', 'X', '"_X', opts)
