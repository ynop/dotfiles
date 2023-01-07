local opt = vim.opt
local g = vim.g

-- [[ Filetypes ]]
opt.encoding = "utf8" -- str:  String encoding to use
opt.fileencoding = "utf8" -- str:  File encoding to use

-- [[ Context ]]
opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 1 -- int:  Min num lines of context
opt.sidescrolloff = 5 -- int:  Min num chars at left/right of context
opt.signcolumn = "yes" -- str:  Show the sign column
opt.cursorline = true -- bool: Show line under cursor

-- [[ Mouse ]] --
opt.mouse = ""

-- [[ Theme ]]
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.background = "dark"
opt.termguicolors = true -- bool: If term supports ui color then enable
g.t_co = 256

-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = true -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for
opt.list = true -- bool: Show trailing spaces

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

-- [[ Wildmenu ]]
opt.wildmode = "longest,list" -- Bash like completions (e.g. when entering a file path)

-- [[ Div ]] 
vim.o.exrc = true
