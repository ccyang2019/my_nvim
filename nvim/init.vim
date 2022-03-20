"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
set clipboard+=unnamedplus
set mouse+=a
"NOTE:https://stackoverflow.com/questions/32103591/vim-cant-scroll-in-iterm2
"set ttymouse=xterm2
"  if has("mouse_sgr")
"    set ttymouse=sgr
" endif

"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"au BufWinEnter * set tabstop=4
"au BufWinEnter * set shiftwidth=4
"au BufWinEnter * set softtabstop=4

lua require('init')


"let g:jupytext_fmt = 'py:hydrogen'                                             
let g:jupytext_fmt = 'py'         

nnoremap <C-t> :NvimTreeToggle<CR>
" disable auto comment
au FileType * set fo-=c fo-=r fo-=o
