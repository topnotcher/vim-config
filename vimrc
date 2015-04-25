execute pathogen#infect()

setlocal spell spelllang=en_us

set ts=4 sw=4
set directory=~/.vim/.vimswap/

filetype indent plugin on

au FileType python setlocal tabstop=4 noexpandtab shiftwidth=4 softtabstop=4
au FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
au FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
au FileType ruby setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Tell vim the terminal supports 256 colors.
set t_Co=256

syntax on

set number
set background=dark
colorscheme solarized

set autowrite

" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

let g:PreserveNoEOL=1
