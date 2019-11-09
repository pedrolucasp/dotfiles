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
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree'
"Plug 'Yggdroot/indentLine'

Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
"Plug '~/.vim/bundle/'

call plug#end()

" Basic Settings

set background=dark
colorscheme plain

set noswapfile
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

" Open FZF
nmap ; :Files <CR>

" Vim Pencil 

let g:pencil#textwidth=72 " FTW
let g:pencil#conceallevel=0

augroup pencil
  autocmd!
  autocmd FileType markdown, mkd call pencil#init({ 'wrap': 'hard', 'autoformat': 0 })
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

" statusline

let g:currentmode={
            \ 'n'  : 'NORMAL ',
            \ 'no' : 'N·OPERATOR PENDING ',
            \ 'v'  : 'VISUAL ',
            \ 'V'  : 'V·LINE ',
            \ '' : 'V·BLOCK ',
            \ 's'  : 'SELECT ',
            \ 'S'  : 'S·LINE ',
            \ '' : 'S·BLOCK ',
            \ 'i'  : 'INSERT ',
            \ 'R'  : 'REPLACE ',
            \ 'Rv' : 'V·REPLACE ',
            \ 'c'  : 'COMMAND ',
            \ 'cv' : 'VIM EX ',
            \ 'ce' : 'EX ',
            \ 'r'  : 'PROMPT ',
            \ 'rm' : 'MORE ',
            \ 'r?' : 'CONFIRM ',
            \ '!'  : 'SHELL ',
            \ 't'  : 'TERMINAL '}

hi PrimaryBlock       ctermfg=00    ctermbg=6
hi SecondaryBlock     ctermfg=07    ctermbg=10
hi Blanks             ctermfg=00    ctermbg=11

hi User1             ctermfg=01    ctermbg=0
hi User2             ctermfg=02    ctermbg=0
hi User3             ctermfg=03    ctermbg=0
hi User4             ctermfg=04    ctermbg=0
hi User5             ctermfg=05    ctermbg=0
hi User6             ctermfg=06    ctermbg=0
hi User7             ctermfg=07    ctermbg=0
hi User8             ctermfg=08    ctermbg=0
hi User9             ctermfg=09    ctermbg=0

highlight EndOfBuffer ctermfg=black ctermbg=black

function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'* '.l:branchname.'  ':''
endfunction

function! ReadOnly() abort
    if !&modifiable && &readonly
        return ' RO'
    elseif &modifiable && &readonly
        return 'RO'
    elseif !&modifiable && !&readonly
        return ''
    else
        return ''
    endif
endfunction

function! Filepath() abort
    let l:basename = expand('%:h')
    let l:filename = expand('%:t')
    let l:extension = expand('%:e')
    let l:prefix = (l:basename ==# '' || l:basename ==# '.') ?
                \ '' : substitute(l:basename . '/', '\C^' . $HOME, '~', '')

    if empty(l:prefix) && empty(l:filename)
        return printf('%%8*%%f%%*%s %%m%%*', '%8*')
    elseif empty(l:prefix)
        return printf('%%8*%%f%%*%s %%m%%*', '%6*')
    else
        return printf('%%8*%s%%*%s%s%%*', l:prefix, &modified ? '%6*' : '%8*', l:filename)
    endif
endfunction

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:status = []
    if l:counts.warning
        call add(l:status, printf('%%3*%s!%%*', l:counts.warning))
    endif
    if l:counts.error
        call add(l:status, printf('%%5*%s×%%*',  l:counts.error))
    endif
    return join(l:status, ' ')
endfunction

function! StatusLine(mode) abort
  let l:line=''

  " help or man pages
  if &filetype ==# 'help' || &filetype ==# 'man'
    let l:line.=' %#StatusLineNC# ['. &filetype .'] %f '
    return l:line
  endif

  " active
  if a:mode ==# 'active'
    let l:line.='%7*%{StatuslineGit()}'
    let l:line.='%<'
    let l:line.=Filepath()

    let l:line.='%5*'
    let l:line.=' %{ReadOnly()} %w%*'
    let l:line.='%9* %=%*'

    let l:line.='%7* %l,%c  %*'
    let l:line.='%8* %{g:currentmode[mode()]}%*'
    let l:line.=' '
    "let l:line.=LinterStatus()

    let l:line.=' '
    let l:line.='%8*'. &filetype . ' '

  else
    " inactive
    let l:line.='%#Blanks#'
    let l:line.='%f %5*%m%*'
    let l:line.='%#Blanks# %=%*'
  endif

  let l:line.='%*'

  return l:line
endfunction

set statusline=%!StatusLine('active')
augroup MyStatusLine
  autocmd!
  autocmd WinEnter * setl statusline=%!StatusLine('active')
  autocmd WinLeave * setl statusline=%!StatusLine('inactive')
augroup END


