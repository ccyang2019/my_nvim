set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set clipboard+=unnamedplus
set mouse+=a
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"au BufWinEnter * set tabstop=4
"au BufWinEnter * set shiftwidth=4
"au BufWinEnter * set softtabstop=4

lua require('init')

