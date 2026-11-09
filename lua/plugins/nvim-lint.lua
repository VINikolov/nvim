return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
  },

  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      go = { 'golangcilint' },
    }

    -- ESLint 7 + pnpm config
    local eslint_d = lint.linters.eslint_d
    table.insert(eslint_d.args, 1, '--resolve-plugins-relative-to')
    table.insert(eslint_d.args, 2, function()
      local found = vim.fs.find('node_modules/@channels-webtrader/eslint-config-degiro', {
        upward = true,
        type = 'directory',
        path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
      })[1]
      return found and (vim.uv.fs_realpath(found) or found) or vim.fn.getcwd()
    end)
		--

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,

      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>cf', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
