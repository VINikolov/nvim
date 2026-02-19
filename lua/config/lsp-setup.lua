vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'

      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('<leader>rr', vim.lsp.buf.rename, '[R]e[n]ame')

    map('<leader>ca', function()
      vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
    end, '[C]ode [A]ction')

    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    map('<C-a>', vim.lsp.buf.hover, 'Hover Documentation')
    map('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  end,
})

local which_key = require 'which-key'

-- document existing key chains
which_key.add {
  { '<leader>c', group = '[C]ode' },
  { '<leader>c_', hidden = true },
  { '<leader>d', group = '[D]ocument' },
  { '<leader>d_', hidden = true },
  { '<leader>g', group = '[G]it' },
  { '<leader>g_', hidden = true },
  { '<leader>h', group = 'Git [H]unk' },
  { '<leader>h_', hidden = true },
  { '<leader>r', group = '[R]ename' },
  { '<leader>r_', hidden = true },
  { '<leader>s', group = '[S]earch' },
  { '<leader>s_', hidden = true },
  { '<leader>t', group = '[T]oggle' },
  { '<leader>t_', hidden = true },
  { '<leader>w', group = '[W]orkspace' },
  { '<leader>w_', hidden = true },
}

-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
which_key.add({
  { '<leader>', group = 'VISUAL <leader>', mode = 'v' },
  { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
}, { mode = 'v' })
