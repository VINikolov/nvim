return {
  'saghen/blink.cmp',
  version = '1.*',

  opts = {
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
    },

    sources = {
      default = { 'lsp', 'path' },
    },

    completion = {
      accept = { auto_brackets = { enabled = false } },
      ghost_text = { enabled = false },
      documentation = {
        window = {
          border = 'rounded',
        },
        auto_show = true,
      },
      menu = {
        border = 'rounded',
      },
    },

    fuzzy = { implementation = 'prefer_rust_with_warning' },

    signature = { enabled = true },
  },

  opts_extend = { 'sources.default' },
}
