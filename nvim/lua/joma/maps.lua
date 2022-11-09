local keymap = vim.keymap
vim.g.mapleader = " "
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit ')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', 'zh', '<C-w>h')
keymap.set('n', 'zk', '<C-w>k')
keymap.set('n', 'zj', '<C-w>j')
keymap.set('n', 'zl', '<C-w>l')

-- Resize window
keymap.set('n', '[', '<C-w><')
keymap.set('n', ']', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Quit window
keymap.set("n", "<leader>q", "<cmd>q!<cr>")

-- saving file quickly
keymap.set("n", "<C-s>", "<cmd>w<cr>")
keymap.set("i", "<C-s>", "<esc><cmd>w<cr>")

-- set no highlight
keymap.set("n", "<leader>h", "<cmd>set nohlsearch<cr>")

-- Indent mode
keymap.set("v", "<S-Tab>", "<gv")
keymap.set("v", "<Tab>", ">gv")

-- Quickly to exit editor
keymap.set("i", "jk", "<esc>")
keymap.set("i", "kj", "<esc>")

-- remove all empty line
keymap.set("n", "<C-d>", "<cmd>g/^$/d<cr>")

-- Quickly open file
keymap.set("n", "<leader>o", "<esc>:e")
