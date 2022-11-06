require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "dockerfile", "typescript", "bash", "css", "dot", "html" },
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
