return {
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
        completeopt = 'menu,menuone,noinsert',
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
      },

      sources = cmp.config.sources {
        {
          name = 'nvim_lsp',

          entry_filter = function(entry, _)
            return require('cmp').lsp.CompletionItemKind.Snippet ~= entry:get_kind()
          end,
        },
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
}
