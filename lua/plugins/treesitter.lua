return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },

    config = function()
      local config = require 'nvim-treesitter.configs'
      config.setup {
        auto_install = true,

        ensure_installed = {
          'bash',
          'html',
          'css',
          'scss',
          'javascript',
          'typescript',
          'json',
          'lua',
        },

        highlight = { enable = true },
        indent = { enable = false },
      }
    end,
  },
}
