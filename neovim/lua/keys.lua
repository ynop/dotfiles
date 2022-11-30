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
			"fc",
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

function M.setup_debug_keymaps()
	local legend = require("legendary")
	local dap = require("dap")
	local debugging = require("config.debugging")
	legend.keymaps({
		{ "<leader>dc", dap.continue, description = "debug continue/run" },
		{ "<leader>dl", dap.run_last, description = "debug last" },
		{ "<leader>dt", dap.toggle_breakpoint, description = "toggle debug breakpoint" },
		{ "<leader>di", dap.step_into, description = "debug step into" },
		{ "<leader>do", dap.step_over, description = "debug step over" },
		{ "<leader>ds", debugging.view_scopes, description = "open debug scopes in window" },
		{ "<leader>df", debugging.view_frames, description = "open debug frames in window" },
		{ "<leader>dh", debugging.hover, description = "show debug info in floating window" },
		{ "<leader>dr", dap.repl.open, description = "inspect debug state with built-in REPL" },
	})
end

function M.setup_split_keymaps()
	local legend = require("legendary")
	local ss = require("smart-splits")

	legend.keymaps({
		{ "<C-K>", ss.move_cursor_up, description = "Move to split above" },
		{ "<C-J>", ss.move_cursor_down, description = "Move to split below" },
		{ "<C-H>", ss.move_cursor_left, description = "Move to split to the left" },
		{ "<C-L>", ss.move_cursor_right, description = "Move to split to the right" },
		{ "\x1bk", ss.resize_up, description = "Resize split at the top" },
		{ "\x1bj", ss.resize_down, description = "Resize split at the bottom" },
		{ "\x1bh", ss.resize_left, description = "Resize split at the left side" },
		{ "\x1bl", ss.resize_right, description = "Resize split at the right side" },
		{ "<leader>s", ss.start_resize_mode, description = "Start split resize mode" },
	})
end

function M.setup_lsp_buffer_keymaps(bufnr)
	local legend = require("legendary")
	local toolbox = require("legendary.toolbox")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	legend.keymaps({
		{ "gd", vim.lsp.buf.definition, description = "LSP go to definition", opts = bufopts },
		{ "gc", vim.lsp.buf.declaration, description = "LSP go to declaration", opts = bufopts },
		{ "K", vim.lsp.buf.hover, description = "LSP hover", opts = bufopts },
		{ "gi", vim.lsp.buf.implementation, description = "LSP goto implementation", opts = bufopts },
		{ "gh", vim.lsp.buf.signature_help, description = "LSP show signature help", opts = bufopts },
		{ "<leader>wa", vim.lsp.buf.add_workspace_folder, description = "LSP add workspace folder", opts = bufopts },
		{
			"<leader>wr",
			vim.lsp.buf.remove_workspace_folder,
			description = "LSP remove workspace folder",
			opts = bufopts,
		},
		{
			"<leader>wl",
			toolbox.lazy(vim.inspect, vim.lsp.buf.list_workspace_folders()),
			description = "LSP list workspace folders",
			opts = bufopts,
		},
		{ "gt", vim.lsp.buf.type_definition, description = "LSP go to type definition", opts = bufopts },
		{ "<leader>rn", vim.lsp.buf.rename, description = "LSP rename", opts = bufopts },
		{ "<leader>ca", vim.lsp.buf.code_action, description = "LSP code action", opts = bufopts },
		{ "gr", vim.lsp.buf.references, description = "LSP list references", opts = bufopts },
	})
end

return M
