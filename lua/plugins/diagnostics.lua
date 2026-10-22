return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,

  config = function()
    require('tiny-inline-diagnostic').setup {
      options = {
        show_diags_only_under_cursor = true,
      },
    }
    vim.diagnostic.config { virtual_text = false }
  end,
}
