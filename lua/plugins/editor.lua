return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  { 'Darazaki/indent-o-matic' },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.animate').setup { scroll = { enable = false } }
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'Dan7h3x/neaterm.nvim',
    branch = 'stable',
    event = 'VeryLazy',
    opts = {
      keymaps = {
        toggle = '<leader>pp',
        close = '<leader>px',
        new_vertical = '<leader>pv',
        new_horizontal = '<leader>ph',
        new_float = '<leader>pf',
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'ibhagwan/fzf-lua',
    },
  },
}
