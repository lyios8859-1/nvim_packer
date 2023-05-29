vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- utf8
vim.g.encoding = 'UTF-8'
vim.o.termencoding = 'UTF-8'
vim.scriptecoding = 'UTF-8'
vim.opt.fileencoding = 'UTF-8'

require('plugins')

require('config.options')
require('config.keymaps')
require('config.cmd-vim')
require('plugin.colorscheme')
require('plugin.text')


require('plugin.y-lualine')
require('plugin.y-mason')
require('plugin.y-lsp')
require('plugin.y-tree')
require('plugin.y-lspkind')
require('plugin.y-luasnip')
require('plugin.y-treesitter')
require('plugin.y-null')
require('plugin.other')
require('plugin.notify')
require('plugin.y-gitsigns')
