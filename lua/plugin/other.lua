require('Comment').setup()
require('todo-comments').setup()
require('fidget').setup()
require('toggleterm').setup({
  direction = 'float',
  open_mapping = [[<c-\>]]
})


require('ufo').setup({
  promder_selector = function()
    zim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    -- 默认展开
    vim.o.foldenable = false

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    return { 'treesitter', 'indent' }
  end
})
