M = {}

local _ = pcall(require, "lspconfig")

M.server_capabilities = function()
  local active_clients = vim.lsp.get_active_clients()
  local active_client_map = {}

  for index, value in ipairs(active_clients) do
    active_client_map[value.name] = index
  end

  vim.ui.select(vim.tbl_keys(active_client_map), {
    prompt = "Select client:",
    format_item = function(item)
      return "capabilites for: " .. item
    end,
  }, function(choice)
    -- print(active_client_map[choice])
    print(vim.inspect(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities.executeCommandProvider))
    vim.pretty_print(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities)
  end)
end
require "joma.lsp.lsp-layhints"
require "joma.lsp.lsp-signature"
require "joma.lsp.lspkindrc"
require "joma.lsp.lsprc"
require "joma.lsp.null_ls"
require("joma.lsp.handlers").setup()

local lsp_lines = require("lsp_lines")
lsp_lines.setup()


return M
