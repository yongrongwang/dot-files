return {
  'loctvl842/monokai-pro.nvim',
  priority = 1000,
  config = function()
    require('monokai-pro').setup {}
    vim.cmd.colorscheme 'monokai-pro-classic'
  end,
}
