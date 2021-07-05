local g = vim.g

require 'plugins'
require 'options'
require 'autocomplete'
require 'maps'
require 'treesitter_config'

-- Misc
-- ====
-- highlight trailing whitespace and delete on save
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[autocmd ColorScheme * highlight ExtraWhitespace guibg=red]])
vim.cmd([[autocmd BufEnter * match ExtraWhitespace /\s\+$/]])
vim.cmd([[autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/]])
vim.cmd([[autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/]])
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- Plugin options
-- ==============
vim.cmd([[autocmd BufWritePre *.py execute ':Black']])

g.airline_powerline_fonts = 1
g['airline#extensions#tabline#enabled'] = 1

g['test#python#djangotest#options'] = '--keepdb'
g['test#python#pytest#executable'] = 'python -m pytest -vv'

require('lualine').setup {
  options = {
      theme = 'solarized_dark',
  },
  sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {'filetype'},
      lualine_y = {'encoding', 'fileformat', 'progress'},
      lualine_z = {'location'}
  },
  tabline = {
    lualine_a = {'filename'},
    lualine_b = {'branch'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
