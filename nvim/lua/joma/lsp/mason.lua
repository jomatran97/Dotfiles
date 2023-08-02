local mason = require ("mason")

local mason_lspconfig =require ("mason-lspconfig")

local servers = {
  "jdtls",
  "jsonls",
  "tsserver",
  "pyright",
  "yamlls",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig = require ("lspconfig")

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("joma.lsp.handlers").on_attach,
    capabilities = require("joma.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = require "joma.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require "joma.lsp.settings.yamlls"
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end


  if server == "tsserver" then
    local tsserver_opts = require "joma.lsp.settings.tsserver"
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "joma.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "jdtls" then
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end

-- TODO: add something to installer later
-- require("lspconfig").motoko.setup {}
