Config.later(function()
  vim.pack.add {
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  }
  require('telescope').setup {
    defaults = {
      path_display = { 'smart' },
    },
  }
  require('telescope').load_extension 'ui-select'

  local builtin = require 'telescope.builtin'

  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  vim.lsp.buf.references = builtin.lsp_references
  vim.lsp.buf.implementation = builtin.lsp_implementations
  vim.lsp.buf.definition = builtin.lsp_definitions
  vim.lsp.buf.type_definition = builtin.lsp_type_definitions
end)