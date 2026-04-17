return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
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
    },
  },
}
