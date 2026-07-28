return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    lazy = false,

    config = function()
      require('nvim-treesitter').install {
        'bash',
        'html',
        'css',
        'scss',
        'javascript',
        'typescript',
        'json',
        'lua',
      }
    end,
  },
}
