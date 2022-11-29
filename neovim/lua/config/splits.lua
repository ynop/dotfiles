local M = {}

function M.setup()
	local ss = require("smart-splits")

	vim.keymap.set("n", "<C-K>", ss.move_cursor_up, {})
	vim.keymap.set("n", "<C-J>", ss.move_cursor_down, {})
	vim.keymap.set("n", "<C-H>", ss.move_cursor_left, {})
	vim.keymap.set("n", "<C-L>", ss.move_cursor_right, {})

	vim.keymap.set("n", "\x1bk", ss.resize_up, {})
	vim.keymap.set("n", "\x1bj", ss.resize_down, {})
	vim.keymap.set("n", "\x1bh", ss.resize_left, {})
	vim.keymap.set("n", "\x1bl", ss.resize_right, {})

	vim.keymap.set("n", "<leader>s", ss.start_resize_mode, {})
end


return M
