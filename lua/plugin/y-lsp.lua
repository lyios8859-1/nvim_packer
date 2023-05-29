local opts = { noremap = true, silent = true }

local keymap = vim.keymap

keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),

  callback = function(ev)
    local bufopts = { buffer = ev.buf }
    -- TODO 绑定一些快捷键
    keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    keymap.set({ 'n', 'i' }, '<leader>ca', vim.lsp.buf.code_action, bufopts)
    keymap.set({ 'n', 'i' }, '<leader>d', ':Telescope lsp_document_symbols<CR>', bufopts)

    -- 定制快捷格式化
    keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, bufopts)
  end
})


local on_attach = function(isTs)
  -- 保存时就格式化
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    callback = function()
      if isTs == true then
        require("typescript").actions.removeUnused({ sync = true })
      end
      vim.lsp.buf.format { async = true }
    end
  })
end


local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    diagnostics = {
      globals = { 'vim' },
    },
  }
})

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = function ()
    on_attach(true)
  end,
  server = {
    init_options = {
      preferences = {
        importModuleSpecifierPreference = 'project=relative',
        jsxAttributeCompletionStyle = 'none'
      }
    }
  },
})
