local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim"
  use "folke/lua-dev.nvim"

  -- Colorschemes
  use "lunarvim/darkplus.nvim"
  use ({
    "rose-pine/neovim",
    as = 'rose-pine'
  })

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Keybinding
  use "folke/which-key.nvim"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- Editing Support
  use 'nacro90/numb.nvim'
  use "windwp/nvim-autopairs"

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-context"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  -- use "wellle/targets.vim"
  -- use "RRethy/nvim-treesitter-textsubjects"
  use "kylechui/nvim-surround"
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
  }

  -- Auto Completion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use "lvimuser/lsp-inlayhints.nvim"
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  use "simrat39/symbols-outline.nvim"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  use "b0o/SchemaStore.nvim"

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls


  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Comment
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"

  -- util
  use "ThePrimeagen/harpoon"
  use "mbbill/undotree"
  use "tpope/vim-fugitive"
  use "folke/trouble.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
