local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
	mapping = cmp.mapping.preset.insert({
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true
	}),
	["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
	["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
	}),
  -- sources = cmp.config.sources({
  --   { name = 'nvim_lsp' },
  --   { name = 'buffer' },
  -- }),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'buffer', keywork_length = 5 },
		{ name = 'npm', keyword_length = 4 }
	},
})
vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
