return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,

  config = function()
    require('catppuccin').setup {
      integrations = {
        harpoon = true,
        neotest = true,
        diffview = true,
        mason = true,
        cmp = true,
        telescope = true,
      },
    }

    vim.cmd 'colorscheme catppuccin-macchiato'
  end,
}
