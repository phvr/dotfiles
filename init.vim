let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tlhr/anderson.vim'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'kovisoft/slimv'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'tag': '4.1', 'do': ':UpdateRemotePlugins' }

call plug#end()

" leader
let mapleader = "\\"

" color (don't forget to set coloscheme in lightline)
set background=dark
set termguicolors
colorscheme anderson
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" deoplete
call deoplete#enable()
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" LanguageClient
set hidden
" pip install --user 'python-language-server[all]'
let g:LanguageClient_serverCommands = {
    \ 'python': ['~/.local/bin/pyls'],
    \ }
let g:LanguageClient_useVirtualText = 0

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <F6> :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>g :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>s :call LanguageClient#textDocument_references()<CR>
nnoremap <C-s> :call LanguageClient#textDocument_documentSymbol()<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }
" set noshowmode
set laststatus=2

" nerdtree
autocmd StdinReadPre * let s:std_in=1
map <C-n> :NERDTreeToggle<CR> 

" tagbar (install exuberant-ctags)
nnoremap <C-t> :TagbarToggle<CR>

" fzf
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
set rtp+=~/.fzf
nnoremap <C-f> :Files<CR>
" install ag (the silver searcher)
nnoremap <C-g> :Ag<CR>
nnoremap <C-l> :Lines<CR>
nnoremap ;; :Commands<CR>
nnoremap <C-b> :Buffers<CR>

" filetypes
au BufNewFile,BufRead *.lytex set filetype=tex
au BufNewFile,BufRead *.asd set filetype=lisp
autocmd FileType lisp setlocal commentstring=\;%s
au BufNewFile,BufRead *.muttrc set filetype=muttrc
autocmd FileType mail setlocal wrap linebreak nolist textwidth=0 wrapmargin=0
autocmd FileType text setlocal wrap linebreak nolist textwidth=0 wrapmargin=0

set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault
set wildchar=<Tab> wildmenu wildmode=longest,full
set wildcharm=<C-z>
set magic
noremap <Esc> <Esc>:nohl<CR>

set scrolloff=3
set ruler
set nu

" breaklines scrollable
map j gj
map k gk

" no arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" windows
nnoremap <Tab> <C-w><C-w>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" tab = spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
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

" ctrl-Space toggles show whitespace
" shift-Tab (in insert mode!) inserts actual tab char, always
set listchars=tab:>-,trail:·
nnoremap <C-Space> :set invlist<CR>
inoremap <S-Tab> <C-V><Tab>
