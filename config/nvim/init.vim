call plug#begin()
" Writing/Prose
Plug 'reedes/vim-pencil',       { 'for': ['text', 'markdown'] }
Plug 'reedes/vim-wordy',        { 'for': ['text', 'markdown'] }
Plug 'junegunn/goyo.vim',       { 'for': ['text', 'markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['text', 'markdown'] }

" Coding
Plug 'wellle/targets.vim'

call plug#end()

" Basic Settings

set swapfile
set dir=/tmp
set nonumber
set smartcase

syntax on
filetype plugin indent on
set laststatus=2

set hlsearch
set incsearch
set ignorecase

set scrolloff=12

set undodir=~/.vim/undodir

set nowrap
set nocursorline
set conceallevel=2
set wildmenu

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set nocompatible

" Vim Pencil 

let g:pencil#textwidth=72 " FTW
let g:pencil#conceallevel=0

augroup pencil
  autocmd!
  autocmd FileType markdown, mkd call pencil#init({ 'wrap': 'hard', 'autoformat': 0 })
augroup END


