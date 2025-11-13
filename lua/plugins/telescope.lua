return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',

  dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },

  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {},
      },
    }

    -- require('telescope').load_extensions('fzf')

    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ff', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  end,
}
