local packer = require('packer')
local use = packer.use

return packer.startup(function()
  use 'wbthomason/packer.nvim'

  -- nvim-treesitter
  use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
          require("treesitter-nvim").config()
      end
  } 
end)
