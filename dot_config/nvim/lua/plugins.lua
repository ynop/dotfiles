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
    use({ "stevearc/dressing.nvim",
        config = function()
            require("config.indent").setup()
        end,
    })

    use({ "lukas-reineke/indent-blankline.nvim" })

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

    -- File Tree
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

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        as = "telescope",
        tag = "0.1.0",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        after = "legendary",
        config = function()
            require("keys").setup_telescope_keymaps()
        end,
    })

    -- Lualine
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

    -- Auto Completion and Snippets
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp").setup()
            require("config.snippets").setup()
            require("keys").setup_snippet_keymaps()
        end,
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-path",
        },
    })

    -- LSP / Formatting / Linting
    use({
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "nvim-lua/plenary.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "lukas-reineke/lsp-format.nvim",
        },
        config = function()
            require("lsp-format").setup()
            require("config.lsp").setup()
            require("config.nullls").setup()
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
            "marilari88/neotest-vitest",
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
        after = "telescope",
        config = function()
            require("config.debugging").setup()
            require("keys").setup_debug_keymaps()
        end,
    })

    -- Code Documentation
    use({
        "danymat/neogen",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('neogen').setup({
                enabled = true,
                snippet_engine = "luasnip",
                languages = {
                    python = {
                        template = {
                            annotation_convention = "google_docstrings"
                        }
                    },
                }
            })
            require("keys").setup_code_documentation_keymaps()
        end,
    })

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

    -- Div
    use({
        "ii14/neorepl.nvim"
    })

    if packer_bootstrap then
        require("packer").sync()
    end

end)
