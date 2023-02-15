local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier, --format JavaScript · TypeScript · Flow · JSX · JSON CSS · SCSS · Less HTML · Vue · Angular GraphQL · Markdown · YAML
    null_ls.builtins.formatting.autopep8, --format python,
  },
}

vim.api.nvim_create_user_command(
  'LspFormatting',
  function()
    vim.lsp.buf.format({
      filter = function(client)
        return client.name == "null-ls"
      end,
      bufnr = 0,
    })
  end,
  { nargs = 0 }
)
