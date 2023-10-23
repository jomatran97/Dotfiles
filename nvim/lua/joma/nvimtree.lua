local nvim_tree = require ("nvim-tree")


local icons = require "joma.icons"


nvim_tree.setup {
  view = {
    width = 30,
  },
  hijack_directories = {
    enable = false,
  },
  -- update_to_buf_dir = {
  --   enable = false,
  -- },
  -- disable_netrw = true,
  -- hijack_netrw = true,
  -- open_on_setup = false,
  filters = {
    custom = { ".git" },
    exclude = { ".gitignore" },
  },
  -- auto_close = true,
  -- open_on_tab = false,
  -- hijack_cursor = false,
  update_cwd = true,
  -- update_to_buf_dir = {
  --   enable = true,
  --   auto_open = true,
  -- },
  -- --   error
  -- --   info
  -- --   question
  -- --   warning
  -- --   lightbulb
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":t",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = icons.ui.ArrowOpen,
          arrow_closed = icons.ui.ArrowClosed,
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = icons.diagnostics.Hint,
      info = icons.diagnostics.Information,
      warning = icons.diagnostics.Warning,
      error = icons.diagnostics.Error,
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  -- system_open = {
  --   cmd = nil,
  --   args = {},
  -- },
  -- filters = {
  --   dotfiles = false,
  --   custom = {},
  -- },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  }
}
