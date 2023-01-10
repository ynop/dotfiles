local M = {}

local null_ls = require("null-ls")

function M.setup()
    null_ls.setup({
        on_attach = require("lsp-format").on_attach,
        sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.isort.with({
                extra_args = { "--profile", "black" },
            }),
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.formatting.sql_formatter,
        },
    })
end

return M
