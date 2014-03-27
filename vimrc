set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Plugin definitions
" ==================

" Vundle manages itself
Bundle 'gmarik/vundle'

" Improvements to vim commands and motions
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'rbgrouleff/bclose.vim'

" 'vim as IDE' features
Bundle 'scrooloose/nerdcommenter'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'

" Python-related plugins
Bundle 'jmcantrell/vim-virtualenv'

" Color scheme
Bundle 'altercation/vim-colors-solarized'

" Version control integration
Bundle 'tpope/vim-fugitive'

" HTML and CSS plugins
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" Haskell plugins
Bundle 'dag/vim2hs'

" nginx
Bundle 'evanmiller/nginx-vim-syntax'

" ansible
Bundle 'chase/vim-ansible-yaml'

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
" ignore some (binary and whatnot) files
set wildignore+=*/htmlcov/*,*/build/*,*/dist/*,*/attachments/*,*.so,*.o,*.pyc,*.pyo,*.swp

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
" GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')

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

autocmd vimenter * call ToggleVExplorer()
autocmd vimenter * wincmd l

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

" disable docstring popup window when completing with Jedi
autocmd FileType python setlocal completeopt-=preview
" go to definition in a new buffer, not tab
let g:jedi#use_tabs_not_buffers = 0

" Tagbar
nmap <F8> :TagbarToggle<CR>

" always expand Haskell enumerations, like derived instances
let g:haskell_conceal_enumerations = 0

