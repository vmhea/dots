require'nvim-treesitter'.setup {
  ensure_installed = { 'bash', 'css', 'html', 'json', 'lua', 'python', 'vim' },
  sync_install = false,
  highlight = { enable = true }
}
