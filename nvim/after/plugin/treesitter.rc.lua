require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "python", "dockerfile", "typescript", "bash", "css", "dot", "html", "vim", "markdown", "markdown_inline" },
  context_commentstring = {
    enable = true,
  },
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
