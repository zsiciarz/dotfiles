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

-- open autocomplete on Ctrl+Space
map('i', '<C-Space>', 'compe#complete()', {noremap = true, silent = true, expr = true})
map('i', '<CR>', 'compe#confirm("<CR>")', {noremap = true, silent = true, expr = true})
-- use Tab/Shift+Tab to scroll between suggestions
map('i', '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', {noremap = true, silent = true, expr = true})
map('i', '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {noremap = true, silent = true, expr = true})
-- this may need expanded version like https://github.com/hrsh7th/nvim-compe#how-to-use-tab-to-navigate-completion-menu
