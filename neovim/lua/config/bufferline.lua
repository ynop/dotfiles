local M = {}
local cokeline = require("cokeline")

function M.setup()
    cokeline.setup({
        default_hl = {
            fg = function(buffer)
                if buffer.is_focused then
                    return "#fbf1c7"
                end
                return "#282828"
            end,
            bg = function(buffer)
                if buffer.is_focused then
                    return "#d65d0e"
                end
                return "#A89984"
            end,
        },
        components = {
            {
                text = function(buffer)
                    return (buffer.index ~= 1) and "▏" or ""
                end,
            },
            {
                text = function(buffer)
                    return " " .. buffer.pick_letter
                end,
            },
            {
                text = function(buffer)
                    return " " .. buffer.filename .. " "
                end,
            },
            {
                text = " ",
            },
        },
    })
end

return M
