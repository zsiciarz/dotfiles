-- Indent with Tab in normal and visual mode; dedent with Shift+Tab
vim.keymap.set('n', '<Tab>', 'v>', { noremap = true })
vim.keymap.set('n', '<S-Tab>', 'v<', { noremap = true })
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true })


vim.keymap.set('i', '<C-space>', function()
    vim.lsp.completion.get()
end)

-- use Tab/Shift-Tab for navigating autocomplete resuls
vim.keymap.set('i', '<Tab>', function()
    if vim.fn.pumvisible() == 1 then return '<C-n>' end
    return '<C-t>'
end, { expr = true })

vim.keymap.set('i', '<S-Tab>', function()
    if vim.fn.pumvisible() == 1 then return '<C-p>' end
    return '<C-d>'
end, { expr = true })

-- select autocomplete result with Enter and stay on the same line
vim.keymap.set('i', '<cr>', function()
    if vim.fn.pumvisible() == 1 then return '<C-y>' end
    return '<cr>'
end, { expr = true })

-- use Ctrl+arrow up/down to switch buffers
vim.keymap.set('', '<C-Up>', ':bn<CR>', { noremap = true })
vim.keymap.set('', '<C-Down>', ':bp<CR>', { noremap = true })

-- toggle tag list with F8
vim.keymap.set('', '<F8>', ':TagbarToggle<CR>', { noremap = true })

-- \t to run a single test nearest to the cursor
vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', { noremap = true, silent = true })

-- \aw to toggle function argument wrapping
vim.keymap.set('n', '<leader>aw', ':ArgWrap<CR>', { noremap = true, silent = true })
