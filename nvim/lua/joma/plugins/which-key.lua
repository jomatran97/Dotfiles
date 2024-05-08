return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end,
  opts = {},
  config = function()
    local which_key = require("which-key")
    local mappings = {
      s = {
        name = "Windows management",
        v = { "<C-w>v", "Split window vertically" },
        h = { "<C-w>s", "Split window horizontally" },
        o = { "<C-w>=", "Make splits equal size" },
        x = { "<cmd>close<CR>", "Close current split" },
      },
      t = {
        name = "Tab management",
        o = { "<cmd>tabnew<CR>", "Open new tab" },
        x = { "<cmd>tabclose<CR>", "Close current tab" },
        n = { "<cmd>tabn<CR>", "Go to next tab" },
        p = { "<cmd>tabp<CR>", "Go to previous tab" },
        m = { "<cmd>MaximizerToggle<CR>", "Maximize/minimize a split" },
      },
      f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd" },
        r = { "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files" },
        s = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
        p = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
        t = { "<cmd>TodoTelescope<cr>", "Find todos" },
      },
      e = {
        name = "File explorer",
        e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
        f = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer on current file" },
        c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer" },
        r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
      },
      w = {
        name = " Session",
        r = { "<cmd>SessionRestore<CR>", "Restore session for cwd" },
        s = { "<cmd>SessionSave<CR>", "Save session for auto session root dir" },
        d = { "<cmd>SessionDelete<CR>", "Detete session for auto session root dir" },
      },
      x = {
        name = "Trouble",
        x = { "<cmd>TroubleToggle<CR>", "Open/close trouble list" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Open trouble workspace diagnostics" },
        d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Open trouble document diagnostics" },
        q = { "<cmd>TroubleToggle quickfix<CR>", "Open trouble quickfix list" },
        l = { "<cmd>TroubleToggle loclist<CR>", "Open trouble location list" },
        t = { "<cmd>TodoTrouble<CR>", "Open todos in trouble" },
      },
    }
    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
    }
    which_key.register(mappings, opts)

    local vopts = {
      mode = "v", -- VISUAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
    }

    local vmappings = {}
    which_key.register(vmappings, vopts)
  end,
}
