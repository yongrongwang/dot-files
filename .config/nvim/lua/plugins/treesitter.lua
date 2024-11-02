return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'query', 'vim', 'vimdoc', 'lua', 'luadoc' },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
