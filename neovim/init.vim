" #######################################################################
" Plugins
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'nvim-tree/nvim-web-devicons'
Plug 'altercation/vim-colors-solarized'

" Show lines for same indentation
Plug 'lukas-reineke/indent-blankline.nvim'

" Better Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fuzzy File Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Status line
Plug 'nvim-lualine/lualine.nvim'

" File Tree
Plug 'nvim-tree/nvim-tree.lua'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

call plug#end()

" #######################################################################
" BASIC CONFIGURATION
"

set ignorecase 			" Ignore case in search patterns
set smartcase 			" Overrides ignorecase if pattern contains upcase
set wildmode=longest,list 	" Bash like completions (e.g. when entering a a file path)

set background=light
colorscheme solarized

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

" Toggle file tree
map <C-n> :NvimTreeToggle<CR>

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
" #######################################################################
" #######################################################################
" #######################################################################
" LUA BASED CONFIGURATION
" #######################################################################
" #######################################################################
" #######################################################################
" #######################################################################

lua <<EOF

-- #######################################################################
-- WEB DEV ICONS
--

require'nvim-web-devicons'.setup {
 color_icons = true;
 default = true;
}


-- #######################################################################
-- LUALINE
--

require('lualine').setup{
    options = {
        theme = 'solarized_light'
    }
}

-- #######################################################################
-- NVIM TREE
--

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = false
require("nvim-tree").setup()

-- #######################################################################
-- LSP
--

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- #######################################################################
-- STUFF THAT NEEDS TO BE AT THE END
--
require'nvim-treesitter.configs'.setup{highlight={enable=true}}

EOF
