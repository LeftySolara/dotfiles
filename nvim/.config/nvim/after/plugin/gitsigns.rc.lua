local status, gitsigns = pcall(require, 'gitsigns')
if (not status) then return end

gitsigns.setup {
  numhl = true,
  current_line_blame = true
}
