set nocompatible
filetype off

filetype plugin indent on
syntax enable

let mapleader = "\\"

" filetypes
au BufNewFile,BufRead *.lytex set filetype=tex
au BufNewFile,BufRead *.asd set filetype=lisp
autocmd FileType lisp setlocal commentstring=\;%s
au BufNewFile,BufRead *.muttrc set filetype=muttrc
autocmd FileType mail setlocal wrap linebreak nolist textwidth=0 wrapmargin=0
autocmd FileType text setlocal wrap linebreak nolist textwidth=0 wrapmargin=0

" incrementeel zoeken, vondst highlighten
set incsearch
set hlsearch

" slim zoeken, global replace default
set ignorecase
set smartcase
set gdefault
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-z>

" cursor nooit op rand scherm
set scrolloff=3
set ruler

" regexp
set magic

set background=dark
set t_Co=256

" tab = spaties
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
" 2 voor lisp
autocmd FileType lisp setlocal shiftwidth=2 softtabstop=2

" autoindent, linewrap
set ai
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
highlight ColorColumn ctermbg=8
set colorcolumn=120

" breaklines als verschillende regels
map j gj
map k gk

" regelnummers
set nu

" ctrl-Spacw toggles show whitespace
" shift-Tab (in insert mode!) inserts actual tab char, always
set listchars=tab:>-,trail:·
nnoremap <C-Space> :set invlist<CR>
inoremap <S-Tab> <C-V><Tab>

" windows
nnoremap <Tab> <C-w><C-w>
nnoremap zz :bd<CR>
