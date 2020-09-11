" #######################################################################
" VIM-PLUG
"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" File Tree
Plug 'scrooloose/nerdtree'

" Style
Plug 'altercation/vim-colors-solarized'

" Fuzzy file
Plug 'kien/ctrlp.vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto Completion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Language Server Client
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" #######################################################################
" VARIA
"

" Use UTF-8
set encoding=utf-8

" #######################################################################
" SEARCH / REPLACE
"

" Enable Highlight Search
set hlsearch
" Highlight while search
set incsearch
" Case Insensitivity Pattern Matching
set ignorecase
" Overrides ignorecase if pattern contains upcase
set smartcase

" #######################################################################
" KEY MAPPING
"

" replace esc by j - k
:inoremap jk <esc>
:inoremap <esc> <nop>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Search by selection
vnoremap // y/<C-R>"<CR>

" #######################################################################
" EDITOR BEHAVIOUR
"

" Line numbers
set number
set relativenumber

" show at list one line above/below cursor
set scrolloff=1
" show at least 5 chars begin/end of line
set sidescrolloff=5

" color-scheme
set background=light
colorscheme solarized

" enable syntax highlighting
syntax on

" show line under cursor
set cursorline

" show line after 80 columns
" highlight ColorColumn ctermbg=lightgray
" set colorcolumn=80

" buffered redraw
:set lazyredraw

" Flag unnecessary Whitespace
:highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" editor
set fileformat=unix
set autoindent

" #######################################################################
" Airline
"

let g:airline_extensions = ['ctrlp']
let g:airline_theme='bubblegum'
let g:airline_solarized_bg='light'

" #######################################################################
" deoplete
"

let g:deoplete#enable_at_startup = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" #######################################################################
" Language Client 
"
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_selectionUI = "location-list"
let g:LanguageClient_diagnosticsList = "location"
let g:LanguageClient_loggingFile = "/tmp/lc.log"
"let g:LanguageClient_loggingLevel = 'DEBUG'

let g:LanguageClient_serverCommands = {
	\ 'python': ['/usr/local/bin/pyls'],
	\ 'dart': ['/Users/matthi/zhaw/p7/dart-sdk/bin/dart', '/Users/matthi/zhaw/p7/dart-sdk/bin/snapshots/analysis_server.dart.snapshot', '--lsp']
	\ }

nnoremap <silent> <C-l>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <C-l>q :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <C-l>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <C-l>f :call LanguageClient#textDocument_formatting()<CR>


