require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python" },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true,
  },
}
