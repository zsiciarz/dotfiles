set nocompatible

call pathogen#infect()

" Indentation
" ===========
"
" preserve current indentation
set autoindent
" indent width
set tabstop=4
" > and < indent width
set shiftwidth=4
" backspace deletes 4 spaces
set softtabstop=4
set shiftround

" for gnome-terminal to work correctly with solarized
set t_Co=16
syntax enable
set background=dark
colorscheme solarized

set expandtab
set cursorline
set showmatch
set nohls
set smartcase
set infercase
set incsearch
set number
set numberwidth=5
set ruler
set autochdir

" print margin
set colorcolumn=80

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace guibg=red
autocmd BufEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

filetype plugin indent on

" omnicomplete, but use Ctrl+Space
set completeopt=longest,menuone
inoremap <Nul> <C-x><C-o>

set tags+=$HOME/.vim/tags/python.ctags

python << EOF
import os
import sys
import vim

# Virtualenv?
venv = os.environ.get('VIRTUAL_ENV', '')
if venv:
    activate_this = os.path.join(venv, 'bin', 'activate_this.py')
    if os.path.exists(activate_this):
        execfile(activate_this, dict(__file__=activate_this))

for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

" HTML AutoCloseTag
autocmd FileType xhtml,xml,htmldjango so ~/.vim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim

" NERD Tree
" automatically load on startup, focus on the editor window
autocmd vimenter * NERDTree
autocmd vimenter * wincmd l
" close vim if NERD Tree is the last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" MiniBufExplorer
" use Ctrl+arrows or Ctrl+Tab to switch buffers
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')

let g:haskell_conceal_enumerations = 0

