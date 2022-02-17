local map = vim.api.nvim_set_keymap

-- Indent with Tab in normal and visual mode; dedent with Shift+Tab
map('', '<Tab>', 'v>', {noremap = true})
map('', '<S-Tab>', 'v<', {noremap = true})
map('v', '<Tab>', '>gv', {noremap = true})
map('v', '<S-Tab>', '<gv', {noremap = true})

-- use Ctrl+arrow up/down to switch buffers
map('', '<C-Up>', ':bn<CR>', {noremap = true})
map('', '<C-Down>', ':bp<CR>', {noremap = true})

-- toggle tag list with F8
map('', '<F8>', ':TagbarToggle<CR>', {noremap = true})

-- \t to run a single test nearest to the cursor
map('n', '<leader>t', ':TestNearest<CR>', {noremap = true, silent = true})

-- \aw to toggle function argument wrapping
map('n', '<leader>aw', ':ArgWrap<CR>', {noremap = true, silent = true})
