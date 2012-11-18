set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manages itself
Bundle 'gmarik/vundle'

" Improvements to vim commands and motions
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'rbgrouleff/bclose.vim'

" 'vim as IDE' features
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'Shougo/neocomplcache'

" Color scheme
Bundle 'altercation/vim-colors-solarized'

" Version control integration
Bundle 'tpope/vim-fugitive'
Bundle 'ludovicchabant/vim-lawrencium'

" HTML and CSS plugins
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'

" Haskell plugins
Bundle 'dag/vim2hs'


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
" round indent to multiple of shiftwidth
set shiftround

" for gnome-terminal to work correctly with solarized
set t_Co=256
" enable syntax highlighting
syntax enable
" dark background for solarized
set background=dark
" the awesome color scheme
colorscheme solarized

" enable switching between unsaved buffers
set hidden
" expand tabs to spaces
set expandtab
" highlight current line
set cursorline
" show matching bracket
set showmatch
" disable highlighting of search results
set nohls
" if ignorecase is set, detect uppercase chars in search pattern
set smartcase
" infer correct character case upon word completion
set infercase
" search-as-you-type
set incsearch
" show line numbers
set number
" minimal number of columns for line number
set numberwidth=5
" show cursor position in the bottom right corner
set ruler
" automatically change directory when opening a file
set autochdir

" enable mouse
set mouse=a

" print margin
if exists('+colorcolumn')
    set colorcolumn=80
endif

" Indent with Tab in normal and visual mode; dedent with Shift+Tab
noremap <Tab> v>
noremap <S-Tab> v<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace guibg=red
autocmd BufEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Ctrl+S saves the file in normal and insert mode
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

" enable filetype-specific plugins and indentation rules
filetype plugin indent on

" omnicomplete, but use Ctrl+Space
set completeopt=longest,menuone
inoremap <Nul> <C-x><C-o>

" Powerline
" using fancy symbols
let g:Powerline_symbols = 'fancy'
" Solarized-compatible color scheme
let g:Powerline_colorscheme = 'skwp'

" ctags for system Python and for virtual environments
let base_ctags_path = $HOME . "/.vim/tags/python.ctags"
exec 'set tags+=' . base_ctags_path
" location of site-packages (virtualenv-aware)
let site_packages = system('python -c "import sys; from distutils.sysconfig import get_python_lib; sys.stdout.write(get_python_lib())"')
if !empty($VIRTUAL_ENV)
    " if we are in a virtualenv, create local ctags file and add it to tags
    let local_ctags_path = $VIRTUAL_ENV . "/python.ctags"
    exec 'silent !ctags -R -f' local_ctags_path site_packages
    exec 'set tags+=' . local_ctags_path
endif

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
let NERDTreeIgnore = ['\.py[c|o]$', '\~$']

" MiniBufExplorer
" use Ctrl+arrows or Ctrl+Tab to switch buffers
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" NeoComplCache
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" See https://github.com/Shougo/neocomplcache/issues/215
inoremap <expr><silent> <CR> <SID>my_cr_function()
function! s:my_cr_function()
    return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')

" always expand Haskell enumerations, like derived instances
let g:haskell_conceal_enumerations = 0

