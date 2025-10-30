return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',

    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      require('nvim-tree').setup {

        -- Remove bookmark mapping from nvim-tree keymaps
        on_attach = function(bufnr)
          local api = require 'nvim-tree.api'
          api.config.mappings.default_on_attach(bufnr)

          vim.keymap.del('n', 'm', { buffer = bufnr })
        end,

        sort = {
          sorter = 'case_sensitive',
        },

        view = {
          width = 40,
          side = 'left',
        },

        renderer = {
          group_empty = true,
        },
      }

      local pass_args = function(func, ...)
        local args = { ... }
        return function()
          func(unpack(args))
        end
      end

      vim.keymap.set(
        'n',
        '<Leader>tf',
        pass_args(require('nvim-tree.api').tree.find_file, { update_root = true, open = true, focus = true }),
        { desc = 'Open nvim-[T]ree [F]ind file' }
      )
      vim.keymap.set('n', '<Leader>ts', require('nvim-tree.api').tree.open, { desc = 'Open nvim-[T]ree Focu[S]' })
      vim.keymap.set('n', '<Leader>tc', require('nvim-tree.api').tree.close, { desc = 'Open nvim-[T]ree [C]lose' })
    end,
  },
}
