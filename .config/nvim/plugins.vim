" PLUGINS
call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vista.vim'
Plug 'lervag/vimtex'
Plug 'andymass/vim-matchup'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-rooter'
Plug 'chriskempson/base16-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" PLUGIN SETTINGS
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1

let g:vimtex_view_method = 'zathura'
