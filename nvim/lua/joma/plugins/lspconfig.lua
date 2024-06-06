local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "antosha417/nvim-lsp-file-operations",
    "folke/neodev.nvim",
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  -- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true)
  end
end

function M.config()
  -- import lspconfig plugin
  local lspconfig = require("lspconfig")

  -- import mason_lspconfig plugin
  local mason_lspconfig = require("mason-lspconfig")

  -- import cmp-nvim-lsp plugin
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  -- used to enable autocompletion (assign to every lsp server config)
  local capabilities = cmp_nvim_lsp.default_capabilities()

  -- Change the Diagnostic symbols in the sign column (gutter)
  -- (not in youtube nvim video)
  local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  mason_lspconfig.setup_handlers({
    -- default handler for installed servers
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = M.on_attach,
        capabilities = capabilities,
      })
    end,
  })
end

return M
