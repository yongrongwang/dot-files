require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<tab>")
nomap("n", "<S-tab>")
nomap("n", "<C-n>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<A-o>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<C-n>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<C-p>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
map("n", "<A-n>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "move buffer to next" })
map("n", "<A-p>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "move buffer to prev" })
map("n", "<leader>de", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "toggle lsp diagnostic" })
map("n", "<leader>fg", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "telescope live grep args" })
