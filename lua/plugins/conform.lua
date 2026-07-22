return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile', 'BufWritePre' },

  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      javascript = { 'oxfmt' },
      typescript = { 'oxfmt' },
      javascriptreact = { 'oxfmt' },
      typescriptreact = { 'oxfmt' },
      css = { 'oxfmt' },
      html = { 'oxfmt' },
      json = { 'oxfmt' },
      lua = { 'stylua' },
      python = { 'black' },
      cs = { 'csharpier' },
    },

    format_on_save = {
      lsp_fallback = false,
      async = false,
      timeout_ms = 1000,
    },
  },
}
