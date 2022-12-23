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
-- see: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
project_files = function()
  local opts = {}
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require"telescope.builtin".git_files(opts)
  else
    require"telescope.builtin".find_files(opts)
  end
end

-- bind fuzzy search under Ctrl+P
vim.api.nvim_set_keymap('n', '<C-p>', '', { noremap = true, silent = true, callback = project_files })
