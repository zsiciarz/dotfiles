set nocompatible
set autoindent
set tabstop=4
set shiftwidth=4
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

nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

filetype plugin indent on

set tags+=$HOME/.vim/tags/python.ctags

python << EOF
import os
import sys
import vim
for p in sys.path:
        if os.path.isdir(p):
                    vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

