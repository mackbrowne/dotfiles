set nocompatible               " be iMproved
filetype on
filetype off                   " required!

" If vundle is not installed, do it first
let vundleExists = 1
if (!isdirectory(expand("$HOME/.vim/bundle/vundle")))
    call system(expand("mkdir -p $HOME/.vim/bundle"))
    call system(expand("git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle"))
    let vundleExists = 0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" github repos
Bundle 'wavded/vim-stylus'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'wlangstroth/vim-haskell'
Bundle 'tpope/vim-commentary'
Bundle 'kana/vim-fakeclip'
Bundle 'godlygeek/tabular'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'chrisbra/color_highlight'
Bundle 'scrooloose/nerdtree'
Bundle 'pivotal/tmux-config'

if vundleExists == 0
  echo "Installing Bundles, ignore errors"
  :BundleInstall
  echo "Things may not work properly until you restart vim"
endif

:let g:tabular_loaded = 1

" Generic Options
set t_Co=256
set laststatus=2
set encoding=utf-8
syntax on
filetype plugin indent on     " required!
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
filetype plugin indent on
set autoindent
set smartindent
set number
set showcmd
set ruler
set expandtab
set autoread
set shiftwidth=2
set tabstop=2
hi MatchParen ctermbg=black ctermfg=none cterm=underline
set fo-=r
set wildignore+=node_modules
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.beam
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.ico
set wildignore+=.sass-cache,.DS_Store,.bundle
set wildignore+=.coffee.js
set wildignore+=*.rbc,*.scssc,*.sassc
set wildignore+=*/spec/dummy/*
set wildignore+=*/tmp/*
let mapleader="f"
set nofoldenable    " disable folding

set backspace=indent,eol,start

" Count inside an html tag as a pair eg <span>hello</span>
set matchpairs+=>:<

" Set high contrast
if filereadable("/tmp/LIGHT")
  set background=light
else
  set background=dark
endif
colo solarized
let g:solarized_contrast="high"

" Keep all lines in files from exceeding x characters so there are no wrapping
" issues when viewed anywhere. 
" The following command will create a vertical line at x
set colorcolumn=100

" Escape + save in one
inoremap Hh <Esc>

" remap : to ; (means you only need to press three keys to write a file)
noremap ; :

" jump more naturally between wrapped lines
noremap j gj
noremap k gk

" show buffer name in terminal title
set title

" faster terminal rendering
set ttyfast

" disable backup file (stops .bak files being written)j
set nobackup

" disable swap file (stops .swp files being written)
set noswapfile

" always show this number of lines above / below the current line, scroll
" accordingly
set scrolloff=3

" easier window nav
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" make splits open in more logical spots
set splitbelow
set splitright

" tab completion in command line
set wildmode=list:longest

" fix mouse support inside tmux
set ttymouse=xterm2

" allow dragging panes with mouse
set mouse=a

" Remove trailing whitespace on save
map <leader>w :%s/\s\+$//e<CR>

set nohlsearch

" default to global replace (no g needed)
set gdefault

" Syntastic
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_error_symbol='⮀'
let g:syntastic_warning_symbol='⮁'

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_mapping_f = '<Leader>e'
let g:EasyMotion_mapping_F = '<Leader>E'
let g:EasyMotion_mapping_t = ''
let g:EasyMotion_mapping_T = ''
let g:EasyMotion_mapping_e = ''
let g:EasyMotion_mapping_E = ''
let g:EasyMotion_mapping_n = ''
let g:EasyMotion_mapping_N = ''
let g:EasyMotion_mapping_W = ''
let g:EasyMotion_mapping_w = ''

" Ag
map <Leader>n :cn<CR>
map <Leader>N :cN<CR>
map <Leader>s :Ag 

" Ctrl p
let g:ctrlp_working_path_mode = ''
map <Leader>t :CtrlP<CR>
map <Leader>g :CtrlPMRU<CR>
map <Leader>f :CtrlPLine<CR>
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_switch_buffer = 0

" NERDTree
:map <Leader>r :NERDTreeToggle<CR>

" Powerline
let g:Powerline_symbols = 'fancy'

" Rainbow Parentheses
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Colorizer
let g:colorizer_auto_filetype='css,html,styl,less'
map <Leader>c :ColorHighlight<CR>

" Source vimrc
map <C-E> :so ~/.vimrc<CR>

" DoF Lua
au BufNewFile,BufRead *.fus set filetype=sql
au BufNewFile,BufRead *.fub set filetype=sql

Bundle 'rking/ag.vim'
