-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  defaults = {
    mapping = {
      i = { -- insert mode
        ['<C-h>'] = 'which_key', -- which_ley : display the keymaps
        ['<esc>'] = require('telescope.actions').close,
      },
      n = { -- normal mode
        ['<C-h>'] = 'which_key', -- which_ley : display the keymaps
      },
    },
    winblend = 20, -- フローティンウィンドウの透明度
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- require('telescope').load_extension('fzf')

local themes = require 'telescope.themes'

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
vim.keymap.set('n', '<leader>h', function()
  builtin.help_tags(themes.get_ivy())
end)
