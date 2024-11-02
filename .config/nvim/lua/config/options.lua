vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 1
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.updatetime = 250
vim.o.timeoutlen = 250
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.confirm = true
vim.o.showtabline = 0
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.list = true
vim.opt.listchars = { tab = '» ', nbsp = '␣' }
vim.opt.whichwrap:append '<>[]hl'
vim.opt.shortmess:append 'I'
