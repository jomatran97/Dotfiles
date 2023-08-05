-- import mason plugin safely
local mason = require("mason")

-- import mason-lspconfig plugin safely
local mason_lspconfig = require("mason-lspconfig")

-- import mason-null-ls plugin safely
local mason_null_ls = require("mason-null-ls")

local config = require "lspconfig"

local servers = {
  "lua_ls",
  "pyright",
  "jdtls"
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
-- enable mason
mason.setup(settings)

mason_lspconfig.setup {
  -- list of servers for mason to install
  ensure_installed = servers,    -- auto-install configure servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}

mason_null_ls.setup {
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "stylua", -- lua formatter
    "prettier",
    "google-java-format",
    "autopep8"
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
}


local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("joma.lsp.handlers").on_attach,
    capabilities = require("joma.lsp.handlers").capabilities,
  }
  server = vim.split(server, "@")[1]
  if server == "sumneko_lua" then
    local l_status_ok, lua_dev = pcall(require, "lua-dev")
    if not l_status_ok then
      return
    end
    -- local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
    local luadev = lua_dev.setup {
      --   -- add any options here, or leave empty to use the default settings
      -- lspconfig = opts,
      lspconfig = {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        --   -- settings = opts.settings,
      },
    }
    lspconfig.sumneko_lua.setup(luadev)
    goto continue
  end
  if server == "pyright" then
    local pyright_opts = require "joma.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end
  if server == "jdtls" then
    goto continue
  end
  config[server].setup(opts)
  ::continue::
end
