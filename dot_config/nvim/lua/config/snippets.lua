function Leave_snippet()
    local luasnip = require("luasnip")
    local e = vim.v.event

    if ((e.old_mode == 's' and e.new_mode == 'n') or e.old_mode == 'i')
        and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
        and not luasnip.session.jump_active
    then
        require('luasnip').unlink_current()
    end
end

local M = {}

function M.setup()

    -- stop snippets when you leave to normal mode
    -- otherwise if you tab elsewhere, it jumps back to the snippet
    vim.api.nvim_command([[
    autocmd ModeChanged * lua Leave_snippet()
]]   )
end

return M
