require 'options'
require 'mappings'
require 'autocmds'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lazydev',
  require 'plugins.nvim-lspconfig',
  require 'plugins.conform',
  require 'plugins.blink',
  require 'plugins.tokyonight',
  require 'plugins.mini',
  require 'plugins.nvim-treesitter',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',
}, {
  ui = {
    icons = {},
  },
})

-- vim: ts=2 sts=2 sw=2 et
