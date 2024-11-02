return {
  'mason-org/mason-lspconfig.nvim',
  event = 'VeryLazy',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {},
    },
    'neovim/nvim-lspconfig',
  },
  opts = {
    ensure_installed = { 'lua_ls', 'stylua' },
  },
}
