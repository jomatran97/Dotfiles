vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	-- lualine
	use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- file explorer
	use 'kyazdani42/nvim-tree.lua'
	-- fuzzy
	use 'nvim-telescope/telescope.nvim'
	-- color scheme
	use "folke/tokyonight.nvim"
	-- make vim scroll more smoothly
	use 'karb94/neoscroll.nvim'
	-- indent in vim
	use 'lukas-reineke/indent-blankline.nvim'
	use 'echasnovski/mini.nvim'
	-- git
	use 'dinhhuy258/git.nvim'
	-- move motion
	use 'phaazon/hop.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'mg979/vim-visual-multi'
	use 'lewis6991/impatient.nvim'
	-- comment
	use 'terrortylor/nvim-comment'
	-- funny
	use 'ThePrimeagen/vim-be-good'
	-- cmd
	use "folke/noice.nvim"
	use "MunifTanjim/nui.nvim"
	use "rcarriga/nvim-notify"
	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'onsails/lspkind-nvim'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use({
			"glepnir/lspsaga.nvim",
			branch = "main",
			requires = {
					{"nvim-tree/nvim-web-devicons"},
					--Please make sure you install markdown and markdown_inline parser
					{"nvim-treesitter/nvim-treesitter"}
			}
	})
	use 'folke/lsp-colors.nvim'
	-- Completion
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-path'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'David-Kunz/cmp-npm'
	-- Utils
	use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })
	use 'windwp/nvim-autopairs'
	use 'akinsho/toggleterm.nvim'
end)
