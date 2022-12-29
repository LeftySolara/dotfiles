local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

nvimtree.setup {}

vim.keymap.set('n', '<F2>', '<cmd>NvimTreeFocus<cr>', {})
vim.keymap.set('n', '<F3>', '<cmd>NvimTreeToggle<cr>', {})
