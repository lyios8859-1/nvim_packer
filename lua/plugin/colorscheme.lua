vim.cmd('colorscheme tokyonight-moon')

require('tokyonight').setup({
  lualine_bold = true,
})

local function tips()
  -- 相关提示信息在左侧预留列显示图标
  vim.fn.sign_define({
    {
      name = 'DiagnosticSignError',
      text = '',
      texthl = 'DiagnosticSignError',
      linehl = 'ErrorLine',
    },
    {
      name = 'DiagnosticSignWarn',
      text = '',
      texthl = 'DiagnosticSignWarn',
      linehl = 'WarningLine',
    },
    {
      name = 'DiagnosticSignInfo',
      text = '',
      texthl = 'DiagnosticSignInfo',
      linehl = 'InfoLine',
    },
    {
      name = 'DiagnosticSignHint',
      text = '',
      texthl = 'DiagnosticSignHint',
      linehl = 'HintLine',
    },
  })
end

tips()
