vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})

local format_group = vim.api.nvim_create_augroup("LspFormatting", {})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {buffer = ev.buf})

    vim.api.nvim_clear_autocmds({ group = format_group, buffer = ev.buf })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = format_group,
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = ev.data.client_id }
      end,
    })
  end,
})


-- TODO: other language servers
vim.lsp.enable({'pylsp'})
