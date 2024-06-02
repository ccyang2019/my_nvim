"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
" if you want to copy from remote vim to local clipboard, 
" 1. :IndentBlanklineToggle
" 2. Shift-CTRL mouse select
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
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")               
let g:copilot_no_tab_map = v:true

"https://www.sobyte.net/post/2022-01/vim-copy-over-ssh/
function Copy()
  let c = join(v:event.regcontents,"\n")
  let c64 = system("base64", c)
  let s = "\e]52;c;" . trim(c64) . "\x07"
  call chansend(v:stderr, s)
endfunction
autocmd TextYankPost * call Copy()
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
set autoindent expandtab tabstop=2 shiftwidth=2
augroup cdpwd
    autocmd!
    autocmd VimEnter * cd $PWD
augroup END


