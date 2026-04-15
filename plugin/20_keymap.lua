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
  vim.keymap.set('n', lhs, rhs, { desc = desc ,silent=true})
end

nmap("<Esc><Esc>", "<cmd>nohl<cr>","disable higlight")
vim.keymap.set('v', ">", ">gv", {silent=true})
vim.keymap.set('v', "<", "<gv", {silent=true})
nmap("<leader>e",vim.diagnostic.open_float,"Line Diagnostic")
