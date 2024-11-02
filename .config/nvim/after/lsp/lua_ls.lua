return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = {
          vim.fn.expand '$VIMRUNTIME/lua',
          '${3rd}/luv/library',
        },
      },
    },
  },
}
