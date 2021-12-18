return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- using packer.nvim
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use "glepnir/galaxyline.nvim"

  -- Language related plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    event = "BufRead",
    config = function()
      require("treesitter-nvim").config()
    end
  }

  use {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    config = function()
      require("nvim-lspconfig").config()
    end
  }

  use "kabouzeid/nvim-lspinstall"

  -- Install nvim-cmp, and buffer source as a dependency
  use {
    "hrsh7th/nvim-compe",
    event = "InsertEnter",
    config = function()
      require("compe-completion").config()
    end
  }

  use {
    "sbdchd/neoformat",
    cmd = "Neoformat"
  }

  use {
    "onsails/lspkind-nvim",
    event = "BufRead",
    config = function()
      require("lspkind").init()
    end
  }

  -- Snippet support
  use {
    "hrsh7th/vim-vsnip",
    event = "InsertCharPre"
  }

  -- File managing , picker etc
  use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
          require("nvimTree").config()
      end
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
        {"nvim-telescope/telescope-media-files.nvim"}
    },
    cmd = {
        "Telescope"
    },
    config = function()
        require("telescope-nvim").config()
    end
  }

  use {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
        require("gitsigns-nvim").config()
    end
  }

  -- misc
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup()
    end
  }

  use "rafamadriz/friendly-snippets"

  use 'navarasu/onedark.nvim'

  -- Discord Rich Presence
  use 'andweeb/presence.nvim'
end)
