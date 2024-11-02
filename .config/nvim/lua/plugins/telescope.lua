return {
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      { '<leader>sf', '<cmd>Telescope find_files<CR>', desc = '[S]earch [F]iles' },
      { '<leader>sp', '<cmd>Telescope git_files<CR>', desc = '[S]earch [P]roject files' },
      { '<leader>sg', '<cmd>Telescope live_grep<CR>', desc = '[S]earch by [G]rep' },
      { '<leader>sb', '<cmd>Telescope buffers<CR>', desc = '[S]earch [B]uffers' },
      { '<leader>so', '<cmd>Telescope oldfiles<CR>', desc = '[S]earch [O]ld Files' },
      { '<leader>sr', '<cmd>Telescope resume<CR>', desc = '[S]earch [R]esume' },
      { '<leader>sa', '<cmd>Telescope live_grep_args live_grep_args<CR>', desc = '[S]earch by grep [A]rgs' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
    opts = {
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
      },
      extensions = {
        fzf = {
          fuzzy = false,
        },
        live_grep_args = {
          auto_quoting = false,
        },
      },
    },
  },
}
