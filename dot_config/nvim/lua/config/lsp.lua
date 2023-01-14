local M = {}

function M.format_code()
    vim.lsp.buf.format({
        filter = function(client)
            return client.name ~= "volar"
        end,
        timeout_ms = 2000
    })
end

function M.setup()
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    })

    require("mason-lspconfig").setup({
        automatic_installation = true,
    })

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        if client.name ~= "volar" then
            require("lsp-format").on_attach(client)
        end
        require("keys").setup_lsp_buffer_keymaps(bufnr)
    end

    local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("lspconfig")["pyright"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
    })

    require("lspconfig")["gopls"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
    })

    require("lspconfig")["golangci_lint_ls"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
    })

    require("lspconfig")["texlab"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        settings = {
            texlab = {
                build = {
                    executable = "lualatex",
                    args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                    onSave = true,
                },
                forwardSearch = {
                    executable = "zathura",
                    args = {
                        '--synctex-editor-command',
                        [[nvim-texlabconfig -file '%{input}' -line %{line}]],
                        '--synctex-forward',
                        '%l:1:%f',
                        '%p',
                    }
                }
            },
        }
    })

    require("lspconfig")["sumneko_lua"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the ls which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
                format = {
                    enable = true,
                    -- Put format options here
                    -- NOTE: the value should be STRING!!
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "4",
                    },
                },
            },
        },
    })

    require("lspconfig")["ltex"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        settings = {
            ltex = {
                language = 'en-US',
            },
        },
    })

    require("lspconfig")["terraformls"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
    })

    require("lspconfig")["dockerls"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
    })

    require("lspconfig")["volar"].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })
end

return M
