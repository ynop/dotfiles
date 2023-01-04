local neotest = require("neotest")


local M = {}

function M.setup()
    neotest.setup({
        adapters = {
            require("neotest-python")({
                dap = { justMyCode = false },
            }),
            require("neotest-plenary"),
        },
        quickfix = {
            enabled = true,
            open = false
        },
    })
end

function M.run_on_current_file()
    neotest.run.run(vim.fn.expand("%"))
end

return M
