vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
