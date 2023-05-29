vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- lsp 和 mason的组合
  use {
    'williamboman/mason.nvim', -- 主要管理语言服务的相关下载配置
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'    -- 主要是通信处理文本源码
  }
  -- 文档树
  use {
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons'
  }
  -- 颜色方案
  use 'folke/tokyonight.nvim'

  -- 多光标操作，在 V-Block 模式下，选中后 Ctrl+N 依次选中其他一致的单词
  use 'mg979/vim-visual-multi'
  -- ds"   cs"' 这中成对的处理删除或修改
  use 'tpope/vim-surround'
  -- i', i", i), i], i}, ip, it. 可视模式下快速选中成对的符号中的内容 :help text-objects.
  use 'gcmt/wildfire.vim'
  -- 成对符号的补全
  use 'windwp/nvim-autopairs'
  -- true/false这种的快速修改
  -- ["true"] = "false",
  -- ["True"] = "False",
  -- ["TRUE"] = "FALSE",
  -- ["Yes"] = "No",
  -- ["YES"] = "NO",
  -- ["1"] = "0",
  -- ["<"] = ">",
  -- ["("] = ")",
  -- ["["] = "]",
  -- ["{"] = "}",
  -- ['"'] = "'",
  -- ['""'] = "''",
  -- ["+"] = "-",
  -- ["==="] = "!=="
  use 'rmagatti/alternate-toggler'
  -- 底下状态栏
  use 'nvim-lualine/lualine.nvim'
  -- 文件名搜索和文本内容搜索的功能
  use {
    -- sudo pacman -S ripgrep
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim'
  }
  -- 代码补全
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    'onsails/lspkind-nvim',
  }

  -- typescript 语言服务需要的ts包
  use 'jose-elias-alvarez/typescript.nvim'
  -- 格式化
  use 'jose-elias-alvarez/null-ls.nvim'

  -- 语法高亮
  use 'nvim-treesitter/nvim-treesitter'

  -- html 标签自闭合
  use 'windwp/nvim-ts-autotag'
  -- 漂亮的括号匹配
  use 'p00f/nvim-ts-rainbow'
  -- 在字符串书写 ${} 自动识别为模板字符串
  use 'axelvc/template-string.nvim'
  -- 注释
  use 'folke/todo-comments.nvim'
  use 'numToStr/Comment.nvim'

  -- 提示插件都在干嘛，可以不要
  use 'j-hui/fidget.nvim'

  -- 消息通知
  use {
    'folke/noice.nvim',
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  }
  -- 内置终端
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
  }
  -- 折叠代码快
  use {
    'kevinhwang91/nvim-ufo',
    'kevinhwang91/promise-async'
  }
  -- git 修改的显示标识
  use 'lewis6991/gitsigns.nvim'
  -- 查看 git 提交记录
end)
