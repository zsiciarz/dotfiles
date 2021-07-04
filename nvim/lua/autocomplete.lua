vim.o.completeopt = 'menuone,noselect'

require'compe'.setup {
  min_length = 1;
  preselect = 'enable';

  source = {
    path = true;
    buffer = true;
    calc = true;
    --nvim_lsp = true;
    nvim_lua = true;
    --ultisnips = true;
  };
}
