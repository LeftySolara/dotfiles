local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    offsets = {
    {
        filetype = "NvimTree",
        text = function ()
          return vim.fn.getcwd()
        end,
        highlight = "Directory",
        text_align = "left"
      }
    }
  },
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
vim.api.nvim_set_keymap('n', ';>', '<cmd>BufferLineMoveNext<cr>', {})
vim.api.nvim_set_keymap('n', ';<', '<cmd>BufferLineMovePrev<cr>', {})
vim.api.nvim_set_keymap('n', ';', '<cmd>BufferLinePick<cr>', {})
