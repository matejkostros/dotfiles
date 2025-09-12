return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <sha:7> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000,
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      })

      -- Gitsigns Keymaps
      vim.keymap.set('n', '<leader>a', ':Gitsigns stage_hunk<CR>', { desc = 'Gitsigns: Stage hunk' })
      vim.keymap.set('n', '<leader>n', ':Gitsigns next_hunk<CR>', { desc = 'Gitsigns: Next hunk' })
      vim.keymap.set('n', '<leader>p', ':Gitsigns prev_hunk<CR>', { desc = 'Gitsigns: Previous hunk' })
      vim.keymap.set('n', '<leader>u', ':Gitsigns undo_stage_hunk<CR>', { desc = 'Gitsigns: Unstage hunk' })
      vim.keymap.set('n', '<leader>r', ':Gitsigns reset_hunk<CR>', { desc = 'Gitsigns: Reset hunk' })
      vim.keymap.set('n', '<leader>A', ':Gitsigns stage_buffer<CR>', { desc = 'Gitsigns: Stage buffer' })
      vim.keymap.set('n', '<leader>R', ':Gitsigns reset_buffer<CR>', { desc = 'Gitsigns: Reset buffer' })
      vim.keymap.set('n', '<leader>d', ':Gitsigns diffthis<CR>', { desc = 'Gitsigns: Diff this' })
      vim.keymap.set('n', '<leader>D', ':Gitsigns diffthis!<CR>', { desc = 'Gitsigns: Diff this (index)' })

      end,
  },
}
