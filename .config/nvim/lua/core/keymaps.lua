-- Neovim keymaps

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader
vim.g.mapleader = ','

-- General
map('n', '<Space><Space>', 'viw', { noremap = true })   -- Select word
map('n', '<leader>q', ':wqa<CR>')                       -- Fast save quit all

-- Plugins
-- NvimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>')           -- Toggle tree

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')     -- Find files
map('n', '<leader>fg', ':Telescope live_grep<CR>')      -- Live grep
map('n', '<leader>fr', ':Telescope resume<CR>')         -- Resume last search

-- Python write + launch
map('n', '<leader>pp', ':w | !python3 %<CR>')
