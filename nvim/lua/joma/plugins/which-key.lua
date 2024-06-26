return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 10
  end,
  opts = {},
  config = function()
    local which_key = require("which-key")
    local mappings = {
      t = { "<cmd>Lspsaga term_toggle<cr>", "Float terminal" },
      q = {"<cmd>q!<CR>","Force quit"},
      w = {"<cmd>w!<CR>","Force save"},
      S = {
        name = "Windows management",
        v = { "<C-w>v", "Split window vertically" },
        h = { "<C-w>s", "Split window horizontally" },
        o = { "<C-w>=", "Make splits equal size" },
        x = { "<cmd>close<CR>", "Close current split" },
      },
      f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd" },
        r = { "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files" },
        s = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
        p = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
      },
      l = {
        name = "lsp",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        f = {
          "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
          "Format",
        },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
        k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        R = { "<cmd>Lspsaga rename<cr>", "Rename" },
        r = { "<cmd>Lspsaga finder<cr>", "Reference" },
        o = { "<cmd>Lspsaga outline<cr>", "Outline" },
      },
      g = {
        name = "Git",
        b = { "<cmd>Gitsigns blame_line<cr>", "blame_line" },
      },
    }
    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
    }
    which_key.register(mappings, opts)

    local vopts = {
      mode = "v",    -- VISUAL mode
      prefix = "<leader>",
      buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
    }

    local vmappings = {}
    which_key.register(vmappings, vopts)
  end,
}
