local execute = vim.api.nvim_command
local fn = vim.fn

-- bootstrap as in packer README
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  -- Improvements to vim commands and motions
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'michaeljsmith/vim-indent-object'
  -- 'vim as IDE' features
  use 'preservim/nerdcommenter'
  use 'preservim/tagbar'
  use 'FooSoft/vim-argwrap'
  use 'tpope/vim-fugitive'
  -- TODO: lualine?
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'edkolev/tmuxline.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'vim-test/vim-test'
  -- Color scheme
  -- see: https://github.com/arcticicestudio/nord/issues/157
  use 'nordtheme/vim'
  -- fuzzy finder
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- language server support
  use 'neovim/nvim-lspconfig'
  use 'nvimtools/none-ls.nvim'

  -- autocomplete and snippets
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Python plugins
  use 'raimon49/requirements.txt.vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
