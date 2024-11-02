return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('telescope').setup {
        defaults = {
          sorting_strategy = 'ascending',
          layout_config = {
            width = 0.99,
            height = 0.99,
            horizontal = {
              preview_width = 0.5,
              prompt_position = 'top',
            },
          },
          mappings = {
            i = {
              ['<C-h>'] = 'which_key',
              ['<M-n>'] = 'cycle_history_next',
              ['<M-p>'] = 'cycle_history_prev',
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = false,
          },
          live_grep_args = {
            auto_quoting = false,
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'live_grep_args')
      pcall(require('telescope').load_extension, 'ui-select')
      local map = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { desc = desc })
      end
      local builtin = require 'telescope.builtin'
      local grepargs = require('telescope').extensions.live_grep_args
      map('<leader>sf', builtin.find_files, '[S]earch [F]iles')
      map('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
      map('<leader><leader>', builtin.buffers, 'Find buffers')
      map('<leader>so', builtin.oldfiles, '[S]earch [O]ld Files')
      map('<leader>sr', builtin.resume, '[S]earch [R]esume')
      map('<leader>sa', grepargs.live_grep_args, '[S]earch by grep [A]rgs')
    end,
  },
}
