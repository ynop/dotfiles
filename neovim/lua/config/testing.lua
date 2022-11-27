local neotest = require("neotest")

local function runOnCurrentFile()
	neotest.run.run(vim.fn.expand("%"))
end

local M = {}

function M.setup()
	neotest.setup({
		adapters = {
			require("neotest-python")({
				dap = { justMyCode = false },
			}),
			require("neotest-plenary"),
		},
	})

	vim.keymap.set("n", "<leader>tn", neotest.run.run, {})
	vim.keymap.set("n", "<leader>tf", runOnCurrentFile, {})
	vim.keymap.set("n", "<leader>ta", neotest.run.attach, {})
	vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, {})
	vim.keymap.set("n", "<leader>to", neotest.output.open, {})
	vim.keymap.set("n", "<leader>tp", neotest.output_panel.toggle, {})
end

return M
