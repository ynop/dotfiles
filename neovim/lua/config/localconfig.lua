local M = {}

-- disable built-in local config file support
vim.o.exrc = false

function M.setup()
	require("exrc").setup({
		files = {
			".nvimrc.lua",
			".nvimrc",
			".exrc.lua",
			".exrc",
		},
	})
end

return M
