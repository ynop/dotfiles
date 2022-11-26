local map = vim.api.nvim_set_keymap

map("i", "jk", "<Esc>", {})

-- Split navigation
map("n", "<C-J>", "<C-W><C-J>", {})
map("n", "<C-K>", "<C-W><C-K>", {})
map("n", "<C-L>", "<C-W><C-L>", {})
map("n", "<C-H>", "<C-W><C-H>", {})

-- Search by selection
map("v", "//", 'y/<C-R>"<CR>', {})

-- Copy to system clipboard
map("v", "<leader>c", '"*y', {})

-- Toggle nvim-tree
map("n", "<C-n>", [[:NvimTreeToggle<CR>]], {})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Diagnostics
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Formatting / Linting
vim.keymap.set("n", "fc", function()
	vim.lsp.buf.format({ timeout_ms = 2000 })
end)

-- Bufferline
map("n", "<leader>h", "<Plug>(cokeline-focus-prev)", {})
map("n", "<leader>l", "<Plug>(cokeline-focus-next)", {})
map("n", "<leader>b", "<Plug>(cokeline-pick-focus)", {})
map("n", "<leader>x", "<Plug>(cokeline-pick-close)", {})

-- Trouble
map("n", "<leader>tt", ":TroubleToggle<CR>", {})
map("n", "<leader>tw", ":TroubleToggle workspace_diagnostics<CR>", {})
map("n", "<leader>td", ":TroubleToggle document_diagnostics<CR>", {})
map("n", "<leader>tq", ":TroubleToggle quickfix<CR>", {})
map("n", "<leader>tl", ":TroubleToggle loclist<CR>", {})
