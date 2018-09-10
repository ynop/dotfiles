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
"Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'jnurmine/Zenburn'
"Plugin 'morhetz/gruvbox'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'

" Code Formatter (https://github.com/google/vim-codefmt)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

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
set background=dark
colorscheme solarized

" enable syntax highlighting
syntax on

" show line under cursor
set cursorline

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

" Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'),
  dict(__file__=activate_this))
EOF

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
