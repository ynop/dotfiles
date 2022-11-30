return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use({
		"morhetz/gruvbox",
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	})

	-- UI
	use({ "stevearc/dressing.nvim" })

	-- Legendary
	use({
		"mrjones2014/legendary.nvim",
		config = function()
			require("legendary").setup()
			require("keys").setup_legendary_keymaps()
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter").setup()
		end,
	})

	-- nvim tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("keys").setup_tree_keymaps()
			require("nvim-tree").setup({})
		end,
	})

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("keys").setup_telescope_keymaps()
		end,
	})

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({})
		end,
	})

	-- Formatting/Linting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("config.nullls").setup()
		end,
	})

	-- Auto Completion and Snippets
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("config.cmp").setup()
		end,
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-path",
		},
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp").setup()
		end,
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	})

	-- Latex
	use({
		"lervag/vimtex",
		config = function()
			require("config.tex").setup()
		end,
	})

	-- Bufferline
	use({
		"noib3/nvim-cokeline",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("config.bufferline").setup()
			require("keys").setup_bufferline_keymaps()
		end,
	})

	-- Trouble
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
			require("keys").setup_trouble_keymaps()
		end,
	})

	-- Testing
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
		},
		config = function()
			require("config.testing").setup()
			require("keys").setup_testing_keymaps()
		end,
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			require("config.debugging").setup()
            require("keys").setup_debug_keymaps()
		end,
	})

	-- Project level settings
	use({
		"MunifTanjim/exrc.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("config.localconfig").setup()
		end,
	})

	-- Editorconfig
	use({
		"gpanders/editorconfig.nvim",
	})

	-- Splits
	use({
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("keys").setup_split_keymaps()
		end,
	})
end)
