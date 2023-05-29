local keymap = vim.keymap
local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- 取消掉默认的快捷键功能
keymap.set('n', 's', '<nop>', opts)
-- 取消x的默认的复制会到剪切板功能
keymap.set('n', 'x', '"_x', opts)
-- 写入
keymap.set('n', '<leader>w', ':w<CR>', opts)

-- 修改 Esc 隐射为 jk 
keymap.set('i', 'jk', '<Esc>')

-- 当超过编辑器的边界视觉上换行了，其实还是一行时，跳行的以实际算一行计算
-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
map('n', 'j', [[v:count ? 'j' : 'gj']], { noremap = true, expr = true })
map('n', 'k', [[v:count ? 'k' : 'gk']], { noremap = true, expr = true })

-- 选择所有
map('n', '<C-a>', 'gg<S-v>G', opts)

-- 单行或多行移动 第一个参数 v：表示是在视图模式下, 第二个参数表示需要修改的键
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- vertical split 垂直
map('n', '<leader>ss', ':split<Return><C-w>w', opts)
-- horizontal split 水平
map('n', '<leader>sv', ':vsplit<Return><C-w>w', opts)

-- 关闭当前tab (close)
keymap.set('n', 'sc', '<C-w>c')
-- 关闭分割的其他tab (close other)
keymap.set('n', 'so', '<C-w>o')

-- 关闭所有的窗口 (close all)
keymap.set('n', '<leader>sa', '<C-w>o:q<CR>')
-- 关闭当前的窗口 (close current)
keymap.set('n', '<leader>q', ':q<CR>')

-- 强制关闭当前的窗口不保存 (close current)
keymap.set('n', '<leader>Q', ':q!<CR>')

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
