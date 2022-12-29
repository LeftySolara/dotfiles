local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Have packer manage itself

  use "nvim-lua/plenary.nvim"

  -- Themes
  use {'navarasu/onedark.nvim',
       config = function () pcall(require, 'plugins.onedark') end
  }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Snippet engine
  use 'L3MON4D3/LuaSnip'

  -- File icons 
  use 'kyazdani42/nvim-web-devicons'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function () pcall(require, 'plugins.lualine') end
  }

  -- vscode-like pictograms
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion

  -- LSP
  use 'glepnir/lspsaga.nvim'
  use "williamboman/mason.nvim" -- simple-to-use language server installer
  use "williamboman/mason-lspconfig.nvim"
  use {
    "jose-elias-alvarez/null-ls.nvim",
    -- config = function () pcall(require, 'plugins.lsp.null_ls') end
  } -- for formatters and linters
  use "RRethy/vim-illuminate"
  use {
    "neovim/nvim-lspconfig",
    -- config = function () pcall(require, 'plugins.lsp') end
  } --enable LSP
  use {
    "kabouzeid/nvim-lspinstall"
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use {'akinsho/nvim-bufferline.lua', after = "catppuccin"}

  use 'norcalli/nvim-colorizer.lua'

  use 'lewis6991/gitsigns.nvim'

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      'nvim-tree/nvim-web-devicons'
    }
  }
end)

