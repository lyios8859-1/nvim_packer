require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local masonLspconfig = require("mason-lspconfig")
-- 配置一些需要的语言自身的服务协议
masonLspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "rust_analyzer",
  },

  automatic_installation = true,
})

