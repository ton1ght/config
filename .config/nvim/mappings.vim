nnoremap <SPACE> <Nop>
let mapleader = " "

map <C-p> :Files<CR>
map <leader>b :Buffers<CR>

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" More natural window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" better copy and paste
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

nnoremap <M-h> :CoqStart<CR>
nnoremap <M-j> :CoqNext<CR>
nnoremap <M-k> :CoqUndo<CR>
nnoremap <M-l> :CoqToLine<CR>

autocmd BufWritePost *.tex TexlabBuild
