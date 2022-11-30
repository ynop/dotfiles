vim.g.mapleader = " "
vim.g.localleader = ","

-- IMPORTS
require("opts")
require("keys").setup_main_keymaps()
require("plugins")
