" #######################################################################
" VUNDLE
"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

"Plugin 'vim-scripts/indentpython.vim'
"Plugin 'nvie/vim-flake8'
"Plugin 'jnurmine/Zenburn'
"Plugin 'morhetz/gruvbox'

" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" File Tree
Plugin 'scrooloose/nerdtree'

" Style
Plugin 'altercation/vim-colors-solarized'

" Fuzzy file
Plugin 'kien/ctrlp.vim'

" Auto Completion
Bundle 'Valloric/YouCompleteMe'

" Syntax Checker
Plugin 'vim-syntastic/syntastic'

" Code Formatter (https://github.com/google/vim-codefmt)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" Markdown Preview
Plugin 'JamshedVesuna/vim-markdown-preview'

" Test Runner
Plugin 'janko-m/vim-test'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

call glaive#Install()
"
" VUNDLE END
"

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

" #######################################################################
" PYTHON
"

" .PY On tab make 4 spaces
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Flag unnecessary Whitespace
:highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Syntax highlighting
let python_highlight_all=1

" #######################################################################
" .SH
"

" .SH On tab make 4 spaces
au BufNewFile,BufRead *.sh
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" #######################################################################
" .yaml/.yml
"

" .yml On tab make 4 spaces
au BufNewFile,BufRead *.yml
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" #######################################################################
" codefmt
"

:nnoremap fc :FormatCode<CR>

augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
	autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	"autocmd FileType python AutoFormatBuffer yapf
	autocmd FileType python AutoFormatBuffer autopep8
augroup END

" #######################################################################
" syntastic
"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']

" Leave out -> pretty slow
" let g:syntastic_rst_checkers = ['sphinx']

" #######################################################################
" markdown preview
"

let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_toggle=1
let vim_markdown_preview_hotkey='<C-m>'

" #######################################################################
" Test Runner
"

" make test commands execute using dispatch.vim
let test#strategy = "vimterminal"

nmap t<C-n> :TestNearest<CR> " t Ctrl+n
nmap t<C-f> :TestFile<CR>    " t Ctrl+f
nmap t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap t<C-l> :TestLast<CR>    " t Ctrl+l
nmap t<C-g> :TestVisit<CR>   " t Ctrl+g

" #######################################################################
" Status line
"

let g:airline_extensions = ['ctrlp', 'syntastic']
let g:airline_theme='bubblegum'
let g:airline_solarized_bg='light'

