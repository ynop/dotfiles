local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use({
        "morhetz/gruvbox",
        config = function()
            vim.cmd("colorscheme gruvbox")
            vim.cmd("highlight Normal ctermfg=223 ctermbg=none guifg=#ebdbb2 guibg=none")
        end,
    })

    -- UI
    use({ "stevearc/dressing.nvim" })

    -- Legendary
    use({
        "mrjones2014/legendary.nvim",
        as = "legendary",
        config = function()
            require("legendary").setup()
            require("keys").setup_main_keymaps()
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
        after = "legendary",
        config = function()
            require("keys").setup_tree_keymaps()
            require("nvim-tree").setup({})
        end,
    })

    -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        after = "legendary",
        config = function()
            require("keys").setup_telescope_keymaps()
        end,
    })

    -- lualine
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            local custom_gruvbox = require('lualine.themes.gruvbox')

            -- Change the background of lualine_c section for normal mode
            custom_gruvbox.normal.a.bg = '#98971a'

            require("lualine").setup({
                options = { theme = custom_gruvbox }
            })
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

    -- Buffers
    use({
        "noib3/nvim-cokeline",
        requires = "kyazdani42/nvim-web-devicons",
        after = "legendary",
        config = function()
            require("config.bufferline").setup()
            require("keys").setup_bufferline_keymaps()
        end,
    })

    use({
        "kazhala/close-buffers.nvim",
        after = "legendary",
        config = function()
            require("keys").setup_buffer_commands()
        end,
    })

    -- Trouble
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        after = "legendary",
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
        after = "legendary",
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
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
        },
        after = "legendary",
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
        after = "legendary",
        config = function()
            require("keys").setup_split_keymaps()
        end,
    })

    if packer_bootstrap then
        require("packer").sync()
    end

    -- Latex
    use({
        "f3fora/nvim-texlabconfig",
        config = function()
            require("texlabconfig").setup()
        end,
        -- ft = { 'tex', 'bib' }, -- for lazy loading
        run = "go build"
        -- run = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
    })

    use({
        "ii14/neorepl.nvim"
    })
end)
