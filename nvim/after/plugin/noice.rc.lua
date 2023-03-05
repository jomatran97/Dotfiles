local noice = require("noice")

noice.setup({
	messages = {
		view_search = "mini",
	},
	views = {
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
	routes = {
		-- {
		-- 	view = "notify",
		-- 	filter = { event = "msg_showmode" },
		-- },
		{
			filter = {
				event = "notify",
				warning = true,
				find = "failed to run generator.*is not executable",
			},
			opts = { skip = true },
		},
	},
	cmdline = {
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    },
  }
})
