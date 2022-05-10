-- Neovim settings

-- Aliases
local cmd = vim.cmd                         -- Execute vim commands
local exec = vim.api.nvim_exec              -- Execute vimscript
local g = vim.g                             -- Global variables
local opt = vim.opt                         -- Set options
local fn = vim.fn                           -- Call vim functions

cmd[[colorscheme nightfox]]

-- General
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.completeopt = 'menuone,noselect'        -- Auto completion

-- UI
opt.number = true                           -- Show line number
-- opt.numberwidth = 5
opt.cursorline = true
opt.linebreak = true                        -- Wrap on word boundary
opt.showmatch = true                        -- Highlight matching brace, block, and parenthesis
opt.termguicolors = true                    -- Enable 24-bit RGB colors
opt.splitright = true
opt.list = true
opt.listchars:append("space:⋅")
opt.listchars:append("eol:↴")

--[[ vim.opt.fillchars = {                       -- Fill characters
    vert = " ",
    vertleft = " ",
    vertright = " ",
    verthoriz = " ",
    horiz = " ",
    horizup = " ",
    horizdown = " ",
    fold = "⠀",
    eob = " ",                              -- suppress ~ at EndOfBuffer
    diff = "⣿",                             -- alternatives = ⣿ ░ ─ ╱
    msgsep = " ",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
} ]]

-- Cursor
cmd[[
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
]]

-- Search
opt.ignorecase = true                       -- Set case insensitive for searches
opt.smartcase = true                        -- Set case sensitive if search starts with uppercase

-- Whitespace
opt.expandtab = true                        -- Use spaces instead of tabs
opt.shiftwidth = 4                          -- Shift 2 spaces when tab
opt.tabstop = 4                             -- Tab length 2 spaces
opt.smartindent = true                      -- Auto indent new lines

-- Startup
-- Disable intro
opt.shortmess:append "sI"

-- Disable built in plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- Automatic commands
-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent!
    \ lua vim.highlight.on_yank{higroup="IncSearch", timeout=1000}
  augroup end
]], false)

-- Remove whitespace on save
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- Don't auto commenting new lines
cmd([[autocmd BufEnter * set fo-=c fo-=r fo-=o]])
