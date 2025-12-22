return {
  'dmmulroy/tsc.nvim',

  config = function()
    require('tsc').setup {
      bin_name = 'tsgo',
    }
  end,
}
