return {
  'stevearc/oil.nvim',
  lazy = false,
  keys = {
    { '-', '<cmd>Oil<CR>', desc = 'Open parent directory', silent = true },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
}
