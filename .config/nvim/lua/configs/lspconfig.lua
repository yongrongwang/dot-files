require("nvchad.configs.lspconfig").defaults()

local servers = { "lua_ls", "html", "cssls", "marksman", "ts_ls", "bashls" }
vim.lsp.enable(servers)
