return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "astro",
      "cmake",
      "cpp",
      "css",
      "gitignore",
      "go",
      "graphql",
      "http",
      "java",
      "php",
      "rust",
      "scss",
      "sql",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
