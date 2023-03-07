vim.cmd("autocmd!")
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = false
vim.opt.scrolloff = 10
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true-- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
-- vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.mouse = "a"
vim.opt.timeoutlen = 1000
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})
