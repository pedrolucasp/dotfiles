let &t_ZM = "\e[3m"

call plug#begin()
" Writing/Prose

Plug 'reedes/vim-litecorrect', { 'for': ['text', 'markdown']  }
Plug 'reedes/vim-pencil', { 'for': ['text', 'markdown'] }
Plug 'reedes/vim-wordy', { 'for': ['text', 'markdown'] }
Plug 'junegunn/goyo.vim', { 'for': ['text', 'markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['text', 'markdown'] }
Plug 'reedes/vim-textobj-quote'
Plug 'kana/vim-textobj-user', { 'for': ['text', 'markdown'] }

Plug 'wellle/targets.vim'
Plug 'andreypopp/vim-colors-plain', { 'branch': 'master' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'andymass/vim-matchup'
"Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree'
"Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'sonph/onehalf', {'rtp': 'vim/'}

Plug 'editorconfig/editorconfig-vim'

Plug 'vim-airline/vim-airline'

call plug#end()

" Basic Settings

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set number

set number
set scrolloff=3
set sidescroll=3

set ruler
set cc=80
set noswapfile
set dir=/tmp
set smartcase

filetype plugin indent on
set laststatus=2

" Search as you type, highlight results
set incsearch
set showmatch
set hlsearch
set ignorecase

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
set mouse=a

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap \\ :noh<cr>
nnoremap Q <Nop>
nnoremap <C-PageUp> :tabnext <cr>
nnoremap <C-PageDown> :tabprevious <cr>


" Open FZF
nmap ; :Files <CR>

" Vim Pencil 

let g:pencil#textwidth=72 " FTW
let g:pencil#conceallevel=0

" Preferences for various files

autocmd FileType c setlocal noet ts=4 sw=4 tw=80
autocmd FileType h setlocal noet ts=4 sw=4 tw=80
autocmd FileType ruby setlocal et ts=2 sw=2
autocmd FileType python setlocal et ts=2 sw=2
autocmd FileType html setlocal et ts=2 sw=2
autocmd FileType css setlocal et ts=2 sw=2

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,txt,text call pencil#init({ 'wrap': 'hard', 'autoformat': 0 })
augroup END

function! GetTabber()  " a lil function that integrates well with Tabular.vim
	let c = nr2char(getchar())
	:execute 'Tabularize /' . c
endfunction

" indentLine
let g:indentLine_setColors = 0
let g:indentLine_char      = '┆'

augroup nerdtree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Status Line
scriptencoding utf-8
