"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
set clipboard+=unnamedplus
set mouse+=a
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"au BufWinEnter * set tabstop=4
"au BufWinEnter * set shiftwidth=4
"au BufWinEnter * set softtabstop=4

call plug#begin()                                                                                                                                                    
     " All this are to get a Jupyter like experience                                 
     Plug 'kana/vim-textobj-user'                                                    
     Plug 'kana/vim-textobj-line'                                                    
     "Plug 'goerz/jupytext.vim'                                                      
     Plug 'GCBallesteros/iron.nvim'                                                  
     Plug 'GCBallesteros/jupytext.vim'                                               
     Plug 'GCBallesteros/vim-textobj-hydrogen'                                       
     "Plug 'j-hui/fidget.nvim'
     "
call plug#end()                                                                                                                                                    
lua require('init')

" Jupytext                                                                     
"let g:jupytext_fmt = 'py:hydrogen'                                             
let g:jupytext_fmt = 'py'         


