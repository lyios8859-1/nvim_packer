require('nvim-autopairs').setup({
  disable_filetype = { 'TelescopePrompt', 'vim' }
})

vim.keymap.set('n', '<leader>ta', ':ToggleAlternate<CR>', { noremap = true, silent = true })
