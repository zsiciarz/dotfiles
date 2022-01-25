local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        -- quit Telescope directly from search window
        ["<esc>"] = actions.close
      },
    },
  }
}
require('telescope').load_extension 'fzf'

-- fall back to file search if git search failed
project_files = function()
  local opts = {}
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

-- bind fuzzy search under Ctrl+P
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd>lua project_files()<CR>]], { noremap = true, silent = true })
