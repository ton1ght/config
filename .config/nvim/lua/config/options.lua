-- line number
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 4 -- 4 spaces for tabs
vim.opt.shiftwidth = 4 -- 4 spaces for indent width
vim.opt.softtabstop = 4
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one
vim.opt.smartindent = true

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.incsearch = true -- update search results while typing

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- no swap or backup files
vim.opt.backup = false
vim.opt.swapfile = false

-- undo dir
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- misc
vim.opt.cursorline = true -- highlight current line
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift
vim.opt.wrap = false
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.wrap = true

-- tex
vim.g.tex_flavor = "latex"
