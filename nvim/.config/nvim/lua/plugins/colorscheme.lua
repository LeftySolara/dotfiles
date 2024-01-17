return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  priority = 1000,
  config = function()
    return {
      require("catppuccin").setup({
        flavour = "frappe",
      }),
    }
  end,
}
