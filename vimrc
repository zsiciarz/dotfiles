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
Plug 'rbgrouleff/bclose.vim'
Plug 'michaeljsmith/vim-indent-object'

" 'vim as IDE' features
Plug 'scrooloose/nerdcommenter'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'Keithbsmiley/tmux.vim'
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim'
Plug 'Valloric/YouCompleteMe', { 'for': ['python', 'javascript', 'rust'] }
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/vimproc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'

" Python-related plugins
Plug 'housleyjk/vim-virtualenv'

" Color scheme
Plug 'altercation/vim-colors-solarized'

" Version control integration
Plug 'tpope/vim-fugitive'

" HTML and CSS plugins
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'Valloric/MatchTagAlways'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'groenewege/vim-less'

" JavaScript and CoffeeScript
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
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

" nginx
Plug 'evanmiller/nginx-vim-syntax'

" ansible
Plug 'chase/vim-ansible-yaml'

" Gradle
Plug 'tfnico/vim-gradle'

" TOML
Plug 'cespare/vim-toml'

" RAML
Plug 'IN3D/vim-raml'

Plug 'zsiciarz/caddy.vim'

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
if exists('+colorcolumn')
    set colorcolumn=80
endif

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
noremap <C-Up>   :MBEbn<CR>
noremap <C-Down> :MBEbp<CR>
" wrap around when using MBE movement commands
let g:miniBufExplCycleArround = 1
" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')

" vimdiff and Gdiff options
" =========================

" use filler lines and open diff in vertical splits
set diffopt=filler,vertical

" Opening files
" =============

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" autocmd vimenter * call ToggleVExplorer()
" autocmd vimenter * wincmd l

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

" Airline
let g:airline_powerline_fonts = 1

" HTML AutoCloseTag
autocmd FileType xhtml,xml,htmldjango so ~/.vim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim

" Syntastic
let g:syntastic_python_flake8_args = '--ignore=E501'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_haskell_ghc_mod_args = '-g -fno-warn-type-defaults'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

" Tagbar
nmap <F8> :TagbarToggle<CR>

" always expand Haskell enumerations, like derived instances
let g:haskell_conceal_enumerations = 0

" YouCompleteMe
autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
let g:ycm_confirm_extra_conf = 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
autocmd FileType python,cpp,rust nnoremap <leader>d :YcmCompleter GoTo<CR>
" disable docstring popup window when completing Python code
autocmd FileType python,cpp,javascript setlocal completeopt-=preview

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-j>'

set tags+=codex.tags;/

let g:ycm_rust_src_path = $HOME."/Development/Rust/rust/src"
" let g:rustfmt_autosave = 1

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

nmap <silent> <leader>t :TestNearest<CR>

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" autoformat Elm code on save
let g:elm_format_autosave = 1
