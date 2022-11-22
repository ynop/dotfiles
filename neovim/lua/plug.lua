return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use("morhetz/gruvbox")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- nvim tree
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })

    -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- lualine
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- LSP
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })

    -- Formatting/Linting
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Auto Completion
    use({
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    })

    -- Snippets
    use({ "L3MON4D3/LuaSnip" })
    use({ "saadparwaiz1/cmp_luasnip" })

    -- Latex
    use({ "lervag/vimtex" })

    -- Bufferline
    use({
        "noib3/nvim-cokeline",
        requires = "kyazdani42/nvim-web-devicons",
    })
end)
