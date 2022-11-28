local M = {}
local dap = require("dap")

local function viewscopes()
	local widgets = require("dap.ui.widgets")
	local my_sidebar = widgets.sidebar(widgets.scopes)
	my_sidebar.open()
end

local function viewframes()
	local widgets = require("dap.ui.widgets")
	local my_sidebar = widgets.sidebar(widgets.frames)
	my_sidebar.open()
end

local function hover()
	require("dap.ui.widgets").hover()
end

function M.setup()
	require("dap-python").setup("~/.venvs/debugpy/bin/python")

	vim.keymap.set("n", "<leader>dc", dap.continue, {})
	vim.keymap.set("n", "<leader>dl", dap.run_last, {})
	vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})

	vim.keymap.set("n", "<leader>di", dap.step_into, {})
	vim.keymap.set("n", "<leader>do", dap.step_over, {})

	vim.keymap.set("n", "<leader>ds", viewscopes, {})
	vim.keymap.set("n", "<leader>df", viewframes, {})
	vim.keymap.set("n", "<leader>dh", hover, {})
	vim.keymap.set("n", "<leader>dr", dap.repl.open, {})
end

return M
