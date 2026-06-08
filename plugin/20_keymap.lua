-- ┌─────────────────┐
-- │ Custom mappings │
-- └─────────────────┘
--
-- This file contains definitions of custom general and Leader mappings.

-- General mappings ===========================================================

-- Use this section to add custom general mappings. See `:h vim.keymap.set()`.

-- An example helper to create a Normal mode mapping
local nmap = function(lhs, rhs, desc)
  -- See `:h vim.keymap.set()`
  vim.keymap.set('n', lhs, rhs, { desc = desc, silent = true })
end

vim.keymap.set({ 'n', 's', 'i' }, '<esc>', function()
  vim.cmd 'noh'
  return '<esc>'
end, { desc = 'Escape and Clear hlsearch', expr = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })
nmap('<leader>e', vim.diagnostic.open_float, 'Line Diagnostic')

vim.keymap.set('v', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('v', 'k', 'gk', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })
vim.keymap.set('v', '<Down>', 'gj', { silent = true })
vim.keymap.set('n', '<Down>', 'gj', { silent = true })
vim.keymap.set('v', '<Up>', 'gk', { silent = true })
vim.keymap.set('n', '<Up>', 'gk', { silent = true })