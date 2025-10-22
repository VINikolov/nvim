return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',

    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind.nvim',
    },

    opts = function()
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'

      return {
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect',
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-S-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
        },
        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
          },
        },
      }
    end,

    config = function(_, opts)
      require('cmp').setup(opts)
    end,
  },
}
