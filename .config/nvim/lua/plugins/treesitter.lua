return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  event = 'VeryLazy',
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
