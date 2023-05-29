vim.o.completeopt = "menuone,noinsert,noselect"

vim.opt.shortmess = vim.opt.shortmess + "c"

vim.g.rustfmt_autosave = 1
-- vim.g.rustfmt_autosave_if_config_present = 1 -- auto save with format
-- vim.g.rustfmt_fail_silently = 1 -- report error

rt = require("rust-tools")

local function on_attach(client, bufnr)
  -- This callback is called when the LSP is atttached/enabled for this buffer
  -- we could set keymaps related to LSP, etc here.
   -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require("rust-tools").setup(opts)

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body)
      vim.fn["luasnips"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
})


require('crates').setup({
  null_ls = {
    enabled = true,
    name = "crates.nvim",
  }
})


-- =============debugger start========================
local dap = require('dap')

dap.adapters.lldbrust = {
  type = "executable",
  attach = { pidProperty = "pid", pidSelect = "ask" },
  -- 这里指向lldb-vscode的实际路径
  -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
  -- 参考 https://zhuanlan.zhihu.com/p/590908735
  -- lldb-vscode lldb-server 提前编译好的路径
  command = "/usr/bin/lldb-vscode",
  env = { LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES" },
}
dap.adapters.rust = dap.adapters.lldbrust

dap.configurations.rust = {
  {
    type = "rust",
    request = "launch",
    name = "lldbrust",
    program = function()
      local metadata_json = vim.fn.system "cargo metadata --format-version 1 --no-deps"
      local metadata = vim.fn.json_decode(metadata_json)
      local target_name = metadata.packages[1].targets[1].name
      local target_dir = metadata.target_directory
      return target_dir .. "/debug/" .. target_name
    end,
    args = function()
-- 同样的进行命令行参数指定
      local inputstr = vim.fn.input("CommandLine Args:", "")
      local params = {}
      for param in string.gmatch(inputstr, "[^%s]+") do
        table.insert(params, param)
      end
      return params
    end,
  },
}

-- 断点快捷键设置
-- https://github.com/mfussenegger/nvim-dap/tree/56118cee6af15cb9ddba9d080880949d8eeb0c9f
-- 设置断点
vim.keymap.set('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>')

vim.keymap.set('n', '<leader>du', ':lua require("dap").continue()<CR>')

-- 单步
vim.keymap.set('n', '<leader>do', ':lua require("dap").step_over()<CR>')
-- 进入
vim.keymap.set('n', '<leader>dr', ':lua require("dap").step_into()<CR>')

-- https://github.com/rcarriga/nvim-dap-ui
-- 显示断点变量作用域栈信息
vim.keymap.set('n', '<leader>da', ':lua require("dapui").toggle()<CR>')

require('dapui').setup()
-- =============debugger end========================
