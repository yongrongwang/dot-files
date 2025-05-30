require "nvchad.options"

-- add yours here!

local o = vim.o
local bo = vim.bo
o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber = true
o.signcolumn = "auto"
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    bo.shiftwidth = 2
    bo.tabstop = 2
    bo.softtabstop = 2
  end
})
