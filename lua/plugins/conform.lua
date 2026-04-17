return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile', 'BufWritePre' },

  opts = {
    notify_on_error = true,
    formatters_by_ft = {
      javascript = { 'biome' },
      typescript = { 'biome' },
      javascriptreact = { 'biome' },
      typescriptreact = { 'biome' },
      css = { 'biome' },
      html = { 'biome' },
      json = { 'biome' },
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
