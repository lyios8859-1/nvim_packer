local builtin = require('telescope.builtin')
local keymap = vim.keymap;

keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Find Files" })
-- keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
-- keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Open Recent File" })
-- keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })
-- keymap.set('n', '<leader>rs', builtin.resume, { desc = "Lists the results incl" })
-- keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "lsp_document_symbols" })


require('nvim-web-devicons').setup({
  override = {},
  default = true
})

local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    path_display = { 'smart' },
    mappings = {
      i = {
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<Esc>"] = actions.close
      }
    }
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.6
    }
  }
})
