local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "bash", "python", "yaml", "terraform", "json", "dockerfile"},
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return M
