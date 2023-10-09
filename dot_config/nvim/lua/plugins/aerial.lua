return {
  {
    "folke/which-key.nvim",
    optional = false,
    opts = {
      defaults = {
        ["<leader>q"] = { name = "+Aerial" },
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>qt", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },
    },
  },
}
