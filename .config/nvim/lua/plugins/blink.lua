return {
  {
    'saghen/blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    opts = {
      fuzzy = {
        implementation = 'lua',
      },
      signature = {
        enabled = true,
      },
    },
  },
}
