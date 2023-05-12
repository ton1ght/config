" PLUGINS
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'whonore/Coqtail'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'andymass/vim-matchup'
"Plug 'ap/vim-css-color'
"Plug 'dart-lang/dart-vim-plugin'
"Plug 'liuchengxu/vista.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'preservim/nerdtree'
call plug#end()

" PLUGIN SETTINGS
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'catppuccin'
" let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#disable_rtp_load=1

let g:coq_settings = { 'auto_start': 'shut-up' }
