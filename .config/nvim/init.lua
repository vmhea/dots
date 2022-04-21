-- Neovim init

-- Packer
require('packer_init')

-- General
require('core/keymaps')
require('core/options')

-- Plugins
require('plugins/lualine')
require('plugins/nvim-tree')
require('plugins/nvim-treesitter')
require('plugins/telescope')
require('plugins/nvim-lspconfig')
require('plugins/nvim-cmp')
