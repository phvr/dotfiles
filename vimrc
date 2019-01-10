set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
set rtp+=~/.fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'kovisoft/slimv'
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/goyo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'mileszs/ack.vim'
" Plugin 'fholgado/minibufexpl.vim'
Plugin 'junegunn/fzf.vim'


call vundle#end()

filetype plugin indent on
syntax enable

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }
set noshowmode
set laststatus=2

" paredit
let g:paredit_mode = 1

" editorconfig has to play nice with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
noremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" nerdtree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR> 

" ack
nnoremap <C-g> :Ack!<Space>

" fzf
nnoremap <C-f> :Files<CR>

" leader
let mapleader = "\<Space>"

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
nnoremap <F12> :b <C-z>
nnoremap <A-left> :bp<CR>
nnoremap <A-right> :bn<CR>

" cursor nooit op rand scherm
set scrolloff=3
set ruler

" regexp
set magic

set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

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
highlight ColorColumn ctermbg=16
set colorcolumn=120

" breaklines als verschillende regels
map j gj
map k gk

" regelnummers
set nu

" tab ipv % voor parenmatch
nnoremap <tab> %
vnoremap <tab> %

" ctrl-T toggles show whitespace
" shift-Tab (in insert mode!) inserts actual tab char, always
set listchars=tab:>-,trail:·
nnoremap <C-t> :set invlist<CR>
inoremap <S-Tab> <C-V><Tab>

" ctrl-P toggles paste
set pastetoggle=<F9>
