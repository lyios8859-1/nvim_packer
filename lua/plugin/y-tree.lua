vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true


-- nvim-tree
local map = vim.api.nvim_set_keymap

map('n', ',e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- ctrl H L 可使得 buffer 与 tree 之间光标的移动


require('nvim-tree').setup({
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  filters = {
    custom = {
      '^.git$',
      '^node_modules$',
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = ''
    }
  },
})
