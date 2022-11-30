local M = {}
local widgets = require("dap.ui.widgets")

function M.view_scopes()
	local my_sidebar = widgets.sidebar(widgets.scopes)
	my_sidebar.open()
end

function M.view_frames()
	local my_sidebar = widgets.sidebar(widgets.frames)
	my_sidebar.open()
end

function M.hover()
	widgets.hover()
end

function M.setup()
	require("dap-python").setup("~/.venvs/debugpy/bin/python")
end

return M
