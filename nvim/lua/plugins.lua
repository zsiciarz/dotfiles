local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


return require("lazy").setup({
  -- Improvements to vim commands and motions
  "folke/lazy.nvim",
  "tpope/vim-repeat",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "michaeljsmith/vim-indent-object",
  -- 'vim as IDE' features
  "preservim/nerdcommenter",
  "preservim/tagbar",
  "FooSoft/vim-argwrap",
  "tpope/vim-fugitive",
  -- TODO: lualine?
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "edkolev/tmuxline.vim",
  {"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"},
  -- Color scheme
  "nordtheme/vim",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "vim-test/vim-test",
  -- fuzzy finder
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  -- autocomplete and snippets
  "L3MON4D3/LuaSnip",
  -- Python plugins
  "raimon49/requirements.txt.vim",
}, {
  install = {
    colorscheme = {"nord"},
  },
})
