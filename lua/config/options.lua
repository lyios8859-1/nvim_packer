local opt = vim.opt

-- 显示行号
opt.number = true
-- 使用相对行号
opt.relativenumber = true

-- 当前光标所在行下划线提示
opt.cursorline = true

--  使用 terminual 颜色
opt.termguicolors = true

opt.history = 1

-- 启用鼠标
opt.mouse:append("a")

-- vim.o.clipboard = "unnamed"
-- 使用系统剪贴板, 需要安装xsel或xclip程序,否者不生效
opt.clipboard:append { 'unnamedplus' }
opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 编辑器左侧会多一列,显示一些图标指示
opt.signcolumn = "yes"

-- 右侧参考线，超过表示代码太长了，考虑换行
opt.colorcolumn = "80"

-- 编辑器的视觉的一行太长是否视觉上换行
opt.wrap = true


-- 当文件被外部程序修改时，自动加载
opt.autoread = true
vim.bo.autoread = true
opt.autowrite = true

-- 禁止创建备份文件
opt.backup = false
opt.writebackup = false
opt.swapfile = false

--
-- 不可见字符的显示，这里只把空格显示为一个点
-- opt.list = true
-- opt.listchars = "space:·"
-- opt.backspace = 'start,eol,indent'
--

-- 搜索
opt.ignorecase = true
opt.smartcase = true
-- 搜索不要高亮
opt.hlsearch = true
-- 边输入边搜索
opt.incsearch = true

-- 新的分割窗口在右边和下边出现
opt.splitright = true
opt.splitbelow = true


-- Finding files - Search down into subfolders
opt.path:append { '**' }
opt.wildignore:append {
  '*/node_modules/*',
  "*/target/*",
}
