return {
  'nvim-neotest/neotest',

  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'marilari88/neotest-vitest',
  },

  keys = {
    { '<leader>tr', '<cmd>Neotest run<cr>' },
    { '<leader>tu', '<cmd>Neotest output<cr>' },
    { '<leader>ty', '<cmd>Neotest summary<cr>' },
    { '<leader>tz', "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
  },

  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-vitest',
      },
    }
  end,
}
