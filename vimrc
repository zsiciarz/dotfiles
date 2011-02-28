set nocompatible

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

" delete trailing whitespace in Python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

filetype plugin indent on

" omnicomplete
set completeopt=longest,menuone

set tags+=$HOME/.vim/tags/python.ctags

python << EOF
import os
import sys
import vim
for p in sys.path:
        if os.path.isdir(p):
                    vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

