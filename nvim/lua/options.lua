local opt = vim.opt

-- highlight current line
opt.cursorline = true
-- show matching bracket
opt.showmatch = true
-- disable highlighting of search results
opt.hlsearch = false
-- if ignorecase is set, detect uppercase chars in search pattern
opt.smartcase = true
-- infer correct character case upon word completion
opt.infercase = true
-- show line numbers
opt.number = true
-- minimal number of columns for line number
opt.numberwidth = 5
-- automatically change directory when opening a file
opt.autochdir = true
-- enable mouse
opt.mouse = 'a'

-- ignore some (binary and whatnot) files and directories
opt.wildignore = '*/htmlcov*,*/build/*,*/dist/*,*/attachments/*,*/node_modules*,*/elm-stuff/*,*/target/*,*.so,*.o,*.pyc,*.pyo,*.swp,*.jar,*.hi'
-- don't fold code (personal preference)
opt.foldenable = false
-- copy backup files instead of moving; fixes filesystem watchers
opt.backupcopy = 'yes'
-- enable switching between unsaved buffers
opt.hidden = true

-- Colors
-- ======
-- enable 24-bit color
opt.termguicolors = true
-- enable Nord
vim.cmd('colorscheme nord')
-- print margin
opt.colorcolumn = '80'

-- Indentation
-- ===========
-- indent 4 spaces in a consistent manner
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
-- round indent to multiple of shiftwidth
opt.shiftround = true
-- expand tabs to spaces
opt.expandtab = true
-- higlight tabs for indentation
opt.list = true
opt.listchars = 'tab:▸ ,eol: '

-- use filler lines and open diff in vertical splits
opt.diffopt = 'filler,vertical'
