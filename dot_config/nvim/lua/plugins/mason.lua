return {
  "mason.nvim",
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    vim.list_extend(opts.ensure_installed, {
      "hadolint",
      "stylua",
      "shfmt",
      "black",
      "taplo",
    })
  end,
}

-- return {
--   "williamboman/mason.nvim",
--   cmd = "Mason",
--   keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
--   build = ":MasonUpdate",
--   opts = {
--     ensure_installed = {
--       "stylua",
--       "shfmt",
--       "black",
--       "taplo",
--     },
--   },
--   ---@param opts MasonSettings | {ensure_installed: string[]}
--   config = function(_, opts)
--     require("mason").setup(opts)
--     local mr = require("mason-registry")
--     local function ensure_installed()
--       for _, tool in ipairs(opts.ensure_installed) do
--         local p = mr.get_package(tool)
--         if not p:is_installed() then
--           p:install()
--         end
--       end
--     end
--     if mr.refresh then
--       mr.refresh(ensure_installed)
--     else
--       ensure_installed()
--     end
--   end,
-- }
