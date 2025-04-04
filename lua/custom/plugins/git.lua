-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'stage git hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'reset git hunk' })

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'stage git hunk' })

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'reset git hunk' })

      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'git [p]review hunk inline' })

      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, { desc = 'git [b]lame line' })

      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff' })

      map('n', '<leader>hD', function()
        gitsigns.diffthis '~'
      end)

      map('n', '<leader>hQ', function()
        gitsigns.setqflist 'all'
      end)
      map('n', '<leader>hq', gitsigns.setqflist)

      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'git toggle current line [b]lame' })
      map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'git toggle [w]ord diff' })

      -- Text object
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'git select [h]unk' })
    end,
  },
}
