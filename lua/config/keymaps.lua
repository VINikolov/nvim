-- [[ Basic Keymaps ]]

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = 1 }
end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1 }
end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Custom remaps
-- vim.keymap.set('v', '<leader>p', "\"_dP")

-- Copy & Paste
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P')
vim.keymap.set({ 'n', 'v' }, 'p', '"0p')
vim.keymap.set({ 'n', 'v' }, 'P', '"0P')

vim.keymap.set({ 'n', 'v' }, 'd', '"0d')
vim.keymap.set('n', 'D', '"0D')

vim.keymap.set('n', 'x', '"0x')
vim.keymap.set('n', 'X', '"0X')

vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

-- Moving around
vim.keymap.set('n', 'J', '20j')
vim.keymap.set('n', 'K', '20k')

-- Diffview
vim.keymap.set('n', '<leader>gs', '<Cmd>DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>gg', '<Cmd>DiffviewClose<CR>')

-- Move lines in view mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- Keep screen centered
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', 'gg', 'ggzz')
vim.keymap.set('n', '*', '*zz')

-- Multiple windows navigation
vim.keymap.set('n', 'mh', '<C-w>h')
vim.keymap.set('n', 'mj', '<C-w>j')
vim.keymap.set('n', 'mk', '<C-w>k')
vim.keymap.set('n', 'ml', '<C-w>l')
vim.keymap.set('n', 'MH', '<C-w>H')
vim.keymap.set('n', 'ML', '<C-w>L')
vim.keymap.set('n', 'MM', '<C-w>_')

-- Replace text in buffer
vim.keymap.set('n', '<leader>rs', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace text in buffer' })

-- Quickfix list
vim.keymap.set('n', ']t', ':cn<CR>')
vim.keymap.set('n', '[t', ':cp<CR>')

-- File formatting
vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = 'Format file' })

-- Terminal
local term_open_job_id = 0
vim.keymap.set('n', '<leader>tt', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 30)

  term_open_job_id = vim.bo.channel
end, { desc = 'Open [T]erminal' })

vim.keymap.set('n', '<leader>tr', function()
  vim.fn.chansend(term_open_job_id, { 'exec zsh\r\n' })
end)

-- React specific keymaps
vim.keymap.set('n', '<leader>ir', "iimport * as React from 'react'<Esc>", { desc = 'Import react snippet' })
vim.keymap.set('n', '<leader>wf', 'i{return }<Esc>x%p%a<CR><CR><Esc>kO', { desc = 'Wrap function return statement into body block' })
vim.keymap.set('n', '<leader>l', "viwy}Oconsole.log('<Esc>pa:', <Esc>pa)<Esc>", { desc = 'Create a console.log for the text under the cursor' })
