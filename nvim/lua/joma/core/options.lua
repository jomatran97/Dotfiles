local globals = {
  mapleader = " ",
}

local options = {
  encoding = "utf-8", -- set encoding
  ma = true,
  mouse = "a",
  cursorline = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  autoread = true,
  nu = true,
  relativenumber = true,
  scrolloff = 8,
  backup = false,
  writebackup = false,
  swapfile = false,
  clipboard = "unnamedplus",
  signcolumn = "yes",
  linebreak = true,
  ignorecase = true,
  spell = false,
  fixendofline=false
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
