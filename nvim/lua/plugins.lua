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
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- TODO: 'edkolev/tmuxline.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'vim-test/vim-test'
  use 'hrsh7th/nvim-compe'
  -- Color scheme
  -- see: https://github.com/arcticicestudio/nord/issues/157
  use 'arcticicestudio/nord-vim'
  -- Python plugins
  use 'raimon49/requirements.txt.vim'
  use {'psf/black',  tag = '20.8b1' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
