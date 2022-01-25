local lspconfig = require 'lspconfig'

local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local on_attach = function(client, bufnr)
  -- TODO: more key bindings as per https://github.com/neovim/nvim-lspconfig
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- run black and isort before saving a Python file
vim.cmd([[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()]])
