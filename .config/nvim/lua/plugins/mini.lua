return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    local statusline = require 'mini.statusline'
    statusline.setup()
    ---@diagnostic disable: duplicate-set-field
    statusline.section_diagnostics = function()
      return ''
    end
    statusline.section_lsp = function()
      return ''
    end
    statusline.section_fileinfo = function()
      return string.format('%s %s %s', vim.bo.filetype, vim.bo.fileencoding, vim.bo.fileformat)
    end
    statusline.section_location = function()
      return '%l:%-v'
    end
  end,
}
