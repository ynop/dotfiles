return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      cmake = { "cmake_format" },
      ["CMakeLists.txt"] = { "cmake_format" },
    },
  },
}
