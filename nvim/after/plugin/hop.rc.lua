local status, hop = pcall(require, "hop")
if (not status) then return end

hop.setup {
  quit_key = '<ESC>',
  case_insensitive = true,
  create_hl_autocmd = true
}
vim.keymap.set("n", "<leader>hs1", "<cmd>HopChar1<cr>")
vim.keymap.set("n", "<leader>hsw", "<cmd>HopPattern<cr>")
vim.keymap.set("v", "<leader>hs1", "<cmd>HopChar1<cr>")
vim.keymap.set("v", "<leader>hsw", "<cmd>HopPattern<cr>")
