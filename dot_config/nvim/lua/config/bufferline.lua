local M = {}
local cokeline = require("cokeline")

function M.setup()
    cokeline.setup({
        default_hl = {
            fg = function(buffer)
                if buffer.is_focused then
                    return "#282828"
                end
                return "#282828"
            end,
            bg = function(buffer)
                if buffer.is_focused then
                    return "#d79921"
                end
                return "#A89984"
            end,
        },
        components = {
            {
                text = function(buffer)
                    return buffer.is_first and "▏" or ""
                end,
            },
            {
                text = function(buffer)
                    return " " .. buffer.pick_letter
                end,
                style = "bold",
            },
            {
                text = function(buffer)
                    return " " .. buffer.filename .. " "
                end,
            },
            {
                text = function(buffer)
                    return buffer.is_modified and "● " or ""
                end,
                fg = function(buffer)
                    return buffer.is_modified and "#cc241d" or nil
                end,
            },
            {
                text = " ",
                bg = "#3c3836",
            },
        },
    })
end

return M
