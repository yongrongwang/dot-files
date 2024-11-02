vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-on-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua' },
  group = vim.api.nvim_create_augroup('indent-file', { clear = true }),
  callback = function()
    vim.o.shiftwidth = 2
  end,
})
