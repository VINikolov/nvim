return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,

  opts = {
    custom_highlights = function()
      return {
        SnippetTabstopActive = {},
      }
    end,
  },

  config = function()
    require('catppuccin').setup {
      integrations = {
        harpoon = true,
        neotest = true,
        diffview = true,
        mason = true,
        blink_cmp = true,
        telescope = true,
      },
    }

    vim.cmd 'colorscheme catppuccin-macchiato'
  end,
}
