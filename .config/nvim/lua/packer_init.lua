return require('packer').startup(function()
  -- packer
  use'wbthomason/packer.nvim'

  -- nvim-web-devicons
  use'kyazdani42/nvim-web-devicons'

  -- nightfox theme
  use'EdenEast/nightfox.nvim'

  -- indent-blankline
  use'lukas-reineke/indent-blankline.nvim'

  -- lualine
  use'nvim-lualine/lualine.nvim'

  -- nvim-tree
  use'kyazdani42/nvim-tree.lua'

  -- nvim-treesitter
  use'nvim-treesitter/nvim-treesitter'

  -- telescope
  use'nvim-telescope/telescope.nvim'

  -- plenary
  use'nvim-lua/plenary.nvim'

  -- kommentary
  use'b3nj5m1n/kommentary'

  -- bufdelete
  use'famiu/bufdelete.nvim'

  -- nvim-autopairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- nvim-lspconfig
  use'neovim/nvim-lspconfig'

  -- nvim-cmp
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }

end
)
