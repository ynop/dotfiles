local M = {}

function M.setup()
    vim.g.indent_blankline_enabled = false

    require("indent_blankline").setup {}
end

return M
