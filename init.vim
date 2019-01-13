" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/local/share/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'tlhr/anderson.vim'
Plug 'itchyny/lightline.vim'
Plug 'kovisoft/slimv'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
" Plug 'nvie/vim-flake8'
" Plug 'nvie/vim-pyunit'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" leader
let mapleader = "\\"

" color (don't forget to set coloscheme in lightline)
set background=dark
set t_Co=256
" let g:solarized_termcolors=16
" colorscheme solarized
colorscheme anderson
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" deoplete
call deoplete#enable()

" LanguageClient
set hidden
" pip install --user 'python-language-server[all]'
let g:LanguageClient_serverCommands = {
    \ 'python': ['~/.local/bin/pyls'],
    \ }

" g:LanguageClient_settingsPath???
" let g:LanguageClient_loggingFile = '~/LC.log'
" let g:LanguageClient_loggingLevel = 'INFO'

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <F6> :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>g :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>s :call LanguageClient#textDocument_references()<CR>
nnoremap <C-s> :call LanguageClient#textDocument_documentSymbol()<CR>

" Rename - rn => rename
noremap <leader>rn :call LanguageClient#textDocument_rename()<CR>
" Rename - rc => rename CamelCase
noremap <leader>rc :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.mixedcase(expand('<cword>'))})<CR>
" Rename - rs => rename snake_case
noremap <leader>rs :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.snakecase(expand('<cword>'))})<CR>
" Rename - ru => rename UPPERCASE
noremap <leader>ru :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.uppercase(expand('<cword>'))})<CR>
"  Rename - rd => rename dash-case
noremap <leader>rd :call LanguageClient#textDocument_rename(
            \ {'newName': Abolish.dashcase(expand('<cword>'))})<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'material',
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
" set noshowmode
set laststatus=2

" paredit
" au BufNewFile,BufRead * call PareditInitBuffer()  

" nerdtree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR> 

" fzf
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
" ~/.fzf/install
set rtp+=~/.fzf
nnoremap <C-f> :Files<CR>
" install ag (the silver searcher)
nnoremap <C-g> :Ag<CR>

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
set wildchar=<Tab> wildmenu wildmode=longest:full
set wildcharm=<C-z>
nnoremap <F12> :b <C-z>
nnoremap <A-left> :bp<CR>
nnoremap <A-right> :bn<CR>

" cursor nooit op rand scherm
set scrolloff=3
set ruler

" regexp
set magic

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

" tab ipv % voor parenmatch
nnoremap <tab> %
vnoremap <tab> %

" ctrl-T toggles show whitespace
" shift-Tab (in insert mode!) inserts actual tab char, always
set listchars=tab:>-,trail:·
nnoremap <C-t> :set invlist<CR>
inoremap <S-Tab> <C-V><Tab>

" toggles paste (:set paste)
set pastetoggle=<F10>
