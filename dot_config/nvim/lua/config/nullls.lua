local M = {}

local null_ls = require("null-ls")

function M.setup()
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.diagnostics.flake8,
        },
    })
end

return M