local lspconfig = require 'lspconfig'
local null_ls = require 'null-ls'

local opts = { noremap=true, silent=true }

vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)


local format_group = vim.api.nvim_create_augroup("LspFormatting", {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
    vim.api.nvim_clear_autocmds({ group = format_group, buffer = ev.buf })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_group,
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end,
})

lspconfig.pylsp.setup {}
lspconfig.ts_ls.setup {}
lspconfig.jsonls.setup {}
null_ls.setup {
  sources = {
    require("none-ls.code_actions.eslint"),
  },
}
