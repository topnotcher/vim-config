setlocal spell spelllang=en_us

set ts=4 sw=4 sts=4 noexpandtab

if has('nvim')
	set directory=~/.vim/.nvimswap/
else
	set directory=~/.vim/.vimswap/
endif

filetype plugin on
filetype indent plugin on

au FileType java setlocal tabstop=4 noexpandtab shiftwidth=4 softtabstop=4
au FileType php setlocal tabstop=4 noexpandtab shiftwidth=4 softtabstop=4
au FileType ruby setlocal tabstop=4 noexpandtab shiftwidth=4 softtabstop=4

" F5 to remove trailing spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround


""""
" PYTHON
""""

" In python, highlight tabs (wow this will get annoying if I read a file with
" tab indentation...)
au FileType python setlocal list listchars=tab:>.,trail:.,extends:#,nbsp:.

" highlight all the things
au FileType python let python_highlight_all=1

" spaccesss
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

let g:python_host_prog = $HOME . '/.vim/env/bin/python'
let g:python3_host_prog = $HOME . '/.vim/env/bin/python'

""" 
" End PYTHON
"""

" Kotlin - same as python
au FileType kotlin setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4

" enable syntax highlighting
syntax on

" line numbering
set number

" Show matching (), {}, [] (default)
set showmatch

set autowrite

" highlight search results (sensible.vim sets ctrl+L to clear)
set hlsearch

" Case insensitive searching except when using capital letters
set ignorecase
set smartcase

" disable line numbers in terminal
if has('nvim')
	au TermOpen * setlocal nonumber norelativenumber
endif

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif


" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
if !has('nvim')
	set viminfo='10,\"100,:20,%,n~/.nviminfo
endif

let g:copilot_enabled = 1  

" restore the cursor to the position it was in in the current file's previous
" editing session
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

set nofixeol

let g:ale_completion_enabled = 1

lua require("config.lazy")

" TODO: probably move this to its own file.
lua require('lualine').setup()

" Tell vim the terminal supports 256 colors and use solarized dark
set t_Co=256
set background=dark
colorscheme solarized
set termguicolors


" TODO
" lua local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
" lua vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
" lua vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
"
" inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"
"
let g:ale_linters = {
\   'python': ['pylint'],
\}
