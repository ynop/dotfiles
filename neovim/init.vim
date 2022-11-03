" #######################################################################
" Plugins
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Show lines for same indentation
Plug 'lukas-reineke/indent-blankline.nvim'

" Better Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fuzzy File Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Status line
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

call plug#end()

" #######################################################################
" BASIC CONFIGURATION
"

set ignorecase 			" Ignore case in search patterns
set smartcase 			" Overrides ignorecase if pattern contains upcase
set wildmode=longest,list 	" Bash like completions (e.g. when entering a a file path)


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

" search by selection
vnoremap // y/<C-R>"<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" #######################################################################
" EDITOR BEHAVIOUR
"

" show relative line numbers
set number
set relativenumber

" show at list one line above/below cursor
set scrolloff=1
" show at least 5 chars begin/end of line
set sidescrolloff=5
" show line under cursor
set cursorline

" number of columns occupied by a tab character
set tabstop=4
" convert tabs to white space
set expandtab
" width for autoindents
set shiftwidth=4
" see multiple spaces as tabstops so <BS> does the right thing
set softtabstop=4

" show trailing spaces
set list

" #######################################################################
" LUALINE
"
"
lua <<EOF
require('lualine').setup {
    options = {
        theme = 'solarized_light',
        icons_enabled = true
    }
}
EOF

" #######################################################################
" STUFF THAT NEEDS TO BE AT THE END
"
lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
