local M = {}
local map = vim.api.nvim_set_keymap

function M.setup_main_keymaps()
	local legend = require("legendary")
	local toolbox = require("legendary.toolbox")

	map("i", "jk", "<Esc>", {})

	local diagnostic_opts = { noremap = true, silent = true }
	legend.keymaps({
		-- General
		{ "//", { v = 'y/<C-R>"<CR>' }, description = "search for selected text" },
		{ "<leader>c", { v = '"*y' }, description = "copy to system clipboard" },
		-- Diagnostics
		{
			"<leader>e",
			vim.diagnostic.open_float,
			description = "show diagnostics in floating window",
			diagnostic_opts,
		},
		{ "[d", vim.diagnostic.goto_prev, description = "goto next diagnostic", diagnostic_opts },
		{ "]d", vim.diagnostic.goto_next, description = "goto previous diagnostic", diagnostic_opts },
		-- LSP
		{
			"<leader>fc",
			toolbox.lazy(vim.lsp.buf.format, { timeout_ms = 2000 }),
			description = "format current buffer",
		},
	})
end

function M.setup_legendary_keymaps()
	local legend = require("legendary")
	legend.keymaps({
		{ "<leader>?", ":Legendary<CR>", description = "search keymaps, commands, autocmds" },
	})
end

function M.setup_tree_keymaps()
	local legend = require("legendary")
	legend.keymaps({
		{ "<C-n>", ":NvimTreeToggle<CR>", description = "open/close file tree" },
	})
end

function M.setup_telescope_keymaps()
	local builtin = require("telescope.builtin")
	local legend = require("legendary")
	legend.keymaps({
		{ "<leader>ff", builtin.find_files, description = "find files in CWD" },
		{ "<leader>fg", builtin.live_grep, description = "search for a string in CWD" },
		{ "<leader>fb", builtin.buffers, description = "find buffer" },
		{ "<leader>fh", builtin.help_tags, description = "find help tags" },
	})
end

function M.setup_trouble_keymaps()
	local legend = require("legendary")
	legend.keymaps({
		{ "<leader>ot", ":TroubleToggle<CR>", description = "toggle trouble" },
		{ "<leader>ow", ":TroubleToggle workspace_diagnostics<CR>", description = "toggle lsp workspace diagnostics" },
		{ "<leader>od", ":TroubleToggle document_diagnostics<CR>", description = "toggle lsp document diagnostics" },
		{ "<leader>oq", ":TroubleToggle quickfix<CR>", description = "toggle quickfix" },
		{ "<leader>ol", ":TroubleToggle loclist<CR>", description = "toggle loclist" },
	})
end

function M.setup_bufferline_keymaps()
	local legend = require("legendary")
	legend.keymaps({
		{ "<leader>h", "<Plug>(cokeline-focus-prev)", description = "move to previous buffer" },
		{ "<leader>l", "<Plug>(cokeline-focus-next)", description = "move to next buffer" },
		{ "<leader>b", "<Plug>(cokeline-pick-focus)", description = "move to buffer by index" },
		{ "<leader>x", "<Plug>(cokeline-pick-close)", description = "close buffer by index" },
	})
end

function M.setup_testing_keymaps()
	local legend = require("legendary")
	local neotest = require("neotest")
	local testing = require("config.testing")
	legend.keymaps({
		{ "<leader>tn", neotest.run.run, description = "run nearest test" },
		{ "<leader>tf", testing.run_on_current_file, description = "run tests in current file" },
		{ "<leader>ta", neotest.run.attach, description = "attach to the nearest test" },
		{ "<leader>ts", neotest.summary.toggle, description = "show test summary window" },
		{ "<leader>to", neotest.output.open, description = "show output of test" },
		{ "<leader>tp", neotest.output_panel.toggle, description = "show test outputs in window" },
	})
end

return M
