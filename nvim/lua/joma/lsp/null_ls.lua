-- import null-ls plugin safely
local null_ls = require("null-ls")

-- for conciseness
local formatting = null_ls.builtins.formatting   -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
  formatting.black.with { extra_args = { "--fast" } },
  formatting.stylua,
  formatting.shfmt,
  formatting.google_java_format,
  formatting.xmlformat,
  formatting.jq
})
