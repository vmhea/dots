return require("packer").startup(function()
    -- packer
    use "wbthomason/packer.nvim"

    -- nvim-tree
    use {
        "kyazdani42/nvim-tree.lua",
		requires = {
            -- file icons
			"kyazdani42/nvim-web-devicons",
		},
		config = function() require"nvim-tree".setup {} end
    }

    -- catppuccin theme
	use ({
		"catppuccin/nvim",
		as = "catppuccin"
	})

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
end)
