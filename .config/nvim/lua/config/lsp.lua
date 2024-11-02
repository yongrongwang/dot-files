vim.diagnostic.config {
  severity_sort = true,
  underline = false,
  jump = {
    float = true,
  },
}
vim.keymap.set('n', '<leader>l', vim.diagnostic.setqflist, { desc = 'Open diagnostic quickfix [L]ist' })
vim.keymap.set('n', 'grd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
vim.keymap.set({ 'n', 'x' }, '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat buffer' })
vim.api.nvim_create_autocmd('BufDelete', {
  group = vim.api.nvim_create_augroup('stop-on-delete', { clear = true }),
  callback = function()
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
      if next(client.attached_buffers) == nil then
        vim.lsp.stop_client(client.id, true)
      end
    end
  end,
})
