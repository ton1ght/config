" GENERAL SETTINGS
set number
set encoding=utf8
set relativenumber
set mouse=a
set ignorecase
set smartcase
set wildmenu
set showcmd
set autoindent
set backspace=indent,eol,start
set shiftwidth=4
set softtabstop=4
set expandtab
set cursorline
set noshowmode
set noswapfile
syntax on

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/theme.vim


lua require("lsp")
