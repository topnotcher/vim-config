execute pathogen#infect()

setlocal spell spelllang=en_us

set ts=4 sw=4
set directory=~/.vim/.vimswap/

filetype indent plugin on

au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
au FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
au FileType ruby setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Tell vim the terminal supports 256 colors.
set t_Co=256

syntax on

set background=dark
colorscheme solarized

set autowrite
