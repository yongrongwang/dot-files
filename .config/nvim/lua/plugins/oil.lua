return {
  'stevearc/oil.nvim',
  keys = {
    { '-', '<cmd>Oil<CR>', desc = 'Open current directory', silent = true },
  },
  opts = {
    watch_for_changes = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return name == '..'
      end,
    },
  },
}
