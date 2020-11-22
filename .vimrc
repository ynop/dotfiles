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

" Lint / Fix / Language Server Client
Plug 'dense-analysis/ale'

" Test Runner
Plug 'vim-test/vim-test'

" Window swap
Plug 'wesQ3/vim-windowswap'

call plug#end()

" #######################################################################
" VARIA
"

" Use UTF-8
set encoding=utf-8

" #######################################################################
" FOLDING

set foldmethod=indent
set foldnestmax=10

" No folding on open
set nofoldenable

" Initial level
set foldlevel=2

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
" :set lazyredraw

" Flag unnecessary Whitespace
:highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" editor
set fileformat=unix
set autoindent

" #######################################################################
" Airline
"

let g:airline_extensions = ['ctrlp', 'ale']
let g:airline_theme='bubblegum'
let g:airline_solarized_bg='light'

" #######################################################################
" ale
"

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_set_balloons = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}

nnoremap <silent> <C-i>h :ALEHover<CR>
nnoremap <silent> <C-i>q :ALEFindReferences<CR>
nnoremap <silent> <C-i>r :ALERename<CR>
nnoremap <silent> <C-i>f :ALEFix<CR>
nnoremap <silent> <C-i>l :ALELint<CR>
nnoremap <silent> <C-i>d :ALEGoToDefinition<CR>
nnoremap <silent> <C-i>n :ALENext<CR>
nnoremap <silent> <C-i>p :ALEPrevious<CR>

" #######################################################################
" deoplete
"

let g:deoplete#enable_at_startup = 1

" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" #######################################################################
" Test Runner
"

let test#strategy = "vimterminal"

nmap t<C-n> :TestNearest<CR> " t Ctrl+n
nmap t<C-f> :TestFile<CR>    " t Ctrl+f
nmap t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap t<C-l> :TestLast<CR>    " t Ctrl+l
nmap t<C-g> :TestVisit<CR>   " t Ctrl+g

" #######################################################################
" Allow project specific .vimrc
"
set exrc
set secure
