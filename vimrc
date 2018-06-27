set nocompatible

" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Plugin definitions
" ==================

" Improvements to vim commands and motions
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'michaeljsmith/vim-indent-object'

" 'vim as IDE' features
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'Keithbsmiley/tmux.vim'
Plug 'w0rp/ale'
Plug 'rking/ag.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'FooSoft/vim-argwrap'

" Python-related plugins
Plug 'jmcantrell/vim-virtualenv'
Plug 'raimon49/requirements.txt.vim'

" Color scheme
Plug 'altercation/vim-colors-solarized'

" Version control integration
Plug 'tpope/vim-fugitive'

" HTML and CSS plugins
Plug 'Valloric/MatchTagAlways'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'groenewege/vim-less'

" JavaScript and other frontend languages
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elmcast/elm-vim'

" PostgreSQL
Plug 'exu/pgsql.vim'

" Haskell plugins
Plug 'eagletmt/ghcmod-vim'
Plug 'dag/vim2hs'

" Rust support
Plug 'rust-lang/rust.vim'

" Nim support
Plug 'zah/nim.vim'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'mattonrails/vim-mix'

" server configuration
Plug 'chr4/nginx.vim'
Plug 'zsiciarz/caddy.vim'
Plug 'chr4/sslsecure.vim'

" ansible
Plug 'chase/vim-ansible-yaml'

" Gradle
Plug 'tfnico/vim-gradle'

" TOML
Plug 'cespare/vim-toml'

" RAML
Plug 'IN3D/vim-raml'


call plug#end()

" Basic options
" ==============

set encoding=utf-8

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
" enable filetype-specific plugins and indentation rules
filetype plugin indent on
" ignore some (binary and whatnot) files and directories
set wildignore+=*/htmlcov*,*/build/*,*/dist/*,*/attachments/*,*/node_modules*,*/elm-stuff/*,*/target/*,*.so,*.o,*.pyc,*.pyo,*.swp,*.jar,*.hi
" fix backspace on Windows
set backspace=2
" use forward slashes when expanding paths on Windows
if exists('+shellslash')
    set shellslash
endif
" don't fold code (personal preference)
set nofoldenable
" copy backup files instead of moving; fixes filesystem watchers
set backupcopy=yes
" don't clutter local directory with backup files
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Colors
" ======

" for gnome-terminal to work correctly with solarized
set t_Co=256
" enable syntax highlighting
syntax enable
" dark background for solarized
set background=dark
" the awesome color scheme
colorscheme solarized
" print margin
set colorcolumn=80

" gVim tweaks
" ===========

" use patched Consolas font on Windows
if has("gui_win32")
    set guifont=Powerline\ Consolas:h12
endif
" disable menu, toolbar and left scrollbar
set guioptions-=m
set guioptions-=T
set guioptions-=L

" Indentation
" ===========

" preserve current indentation
set autoindent
" indent 4 spaces in a consistent manner
set tabstop=4 shiftwidth=4 softtabstop=4
" round indent to multiple of shiftwidth
set shiftround
" expand tabs to spaces
set expandtab
" Indent with Tab in normal and visual mode; dedent with Shift+Tab
noremap <Tab> v>
noremap <S-Tab> v<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" higlight tabs for indentation (Solarized-compatible colors)
set list
set listchars=tab:▸\ ,
highlight SpecialKey cterm=none ctermfg=0 guifg=#073642 ctermbg=8 guibg=#002b36

" Navigating between buffers
" ==========================

" enable switching between unsaved buffers
set hidden
" use Ctrl+arrow up/down to switch buffers
noremap <C-Up>   :bn<CR>
noremap <C-Down> :bp<CR>

" vimdiff and Gdiff options
" =========================

" use filler lines and open diff in vertical splits
set diffopt=filler,vertical

" netrw options
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_list_hide = '^\.\S\+,\~$,\.pyc$,\.pyo$,__pycache__/,\.egg-info/'
" disable mouse actions; see ~/.vim/after/ftplugin/netrw.vim for more
let g:netrw_mousemaps = 0
let g:netrw_winsize = 20

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace guibg=red
autocmd BufEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" use 2 spaces in YAML files, every time
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ALE
let g:ale_python_flake8_options = '--ignore=E501'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" always expand Haskell enumerations, like derived instances
let g:haskell_conceal_enumerations = 0

" YouCompleteMe
autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = 'python'
let g:ycm_rust_src_path = $HOME."/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
autocmd FileType python,cpp,rust nnoremap <leader>d :YcmCompleter GoTo<CR>
" disable docstring popup window when completing code
autocmd FileType python,cpp,javascript setlocal completeopt-=preview

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-j>'

let g:rustfmt_autosave = 1

let g:sql_type_default = 'pgsql'

let g:jsx_ext_required = 0

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : '#(t now)',
      \'y'    : ['%Y-%m-%d', '%H:%M'],
      \'z'    : '#h',
      \'options': {'status-justify': 'left'}
      \}

" \t to run a single test nearest to the cursor
nmap <silent> <leader>t :TestNearest<CR>
let test#python#djangotest#options = '--keepdb'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" autoformat Elm code on save
let g:elm_format_autosave = 1

nnoremap <silent> <leader>aw :ArgWrap<CR>
let g:argwrap_tail_comma = 1
