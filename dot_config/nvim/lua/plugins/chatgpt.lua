return {
  {
    "folke/which-key.nvim",
    optional = false,
    opts = {
      defaults = {
        ["<leader>a"] = { name = "+AI" },
      },
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "op read op://Personal/OpenAI/api_secret --no-newline",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>ac", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
      { "<leader>ae", "<cmd>ChatGPTEditWithInstruction<CR>", mode = { "n", "v" }, desc = "ChatGPTEditWithInstruction" },
      { "<leader>at", "<cmd>ChatGPTRun translate<CR>", mode = { "n", "v" }, desc = "translate (ChatGPT)" },
      { "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", mode = { "n", "v" }, desc = "docstring (ChatGPT)" },
      {
        "<leader>ag",
        "<cmd>ChatGPTRun grammar_correction<CR>",
        mode = { "n", "v" },
        desc = "grammar correction (ChatGPT)",
      },
      { "<leader>ap", "<cmd>ChatGPTRun add_tests<CR>", mode = { "n", "v" }, desc = "add tests (ChatGPT)" },
    },
  },
}
