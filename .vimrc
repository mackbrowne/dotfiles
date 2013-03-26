set nocompatible               " be iMproved
filetype on
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required!
Bundle 'gmarik/vundle'
" My Bundles here:
"
" github repos
Bundle 'wavded/vim-stylus'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'epmatsw/ag.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'wlangstroth/vim-haskell'

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

" Set high contrast
set background=dark
colorscheme solarized
let g:solarized_contrast="high"

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

" tab completion in command line
set wildmode=list:longest

" fix mouse support inside tmux
set ttymouse=xterm2

" Remove trailing whitespace
map <leader>w :%s/\s\+$//e<CR>

set nohlsearch

" default to global replace (no g needed)
set gdefault

" File Extensions
au BufRead,BufNewFile *.pde set filetype=java

" Syntastic
let g:syntastic_html_checker = []
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
map <Leader>s :Ag --ignore="node_modules/ 
map <Leader>S :Ag

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
