local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

catppuccin.setup({
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    lsp_saga = true,
  },
  flavour = "frappe",
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = { "bold" },
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },

})

vim.cmd.colorscheme "catppuccin"
