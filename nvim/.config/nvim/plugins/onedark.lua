local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

onedark.setup({
  style = 'cool',
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'bold',
    strings = 'none',
    variables = 'none'
  },
})
