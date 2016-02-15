execute pathogen#infect()

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

""" 
" End PYTHON
"""

" Tell vim the terminal supports 256 colors.
set t_Co=256
		
" enable syntax highlighting
syntax on

" line numbering
set number

" Show matching (), {}, [] (default)
set showmatch

" sexyness
set background=dark
colorscheme solarized

set autowrite

" highlight search results (sensible.vim sets ctrl+L to clear)
set hlsearch

" Case insensitive searching except when using capital letters
set ignorecase
set smartcase

autocmd! BufWritePost * Neomake
autocmd! BufreadPost * Neomake


" Tell vim to remember certain things when we exit
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  "100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
if !has('nvim')
	set viminfo='10,\"100,:20,%,n~/.nviminfo
endif


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


" BEGIN Preserve EOL
" Because certain satanic windows editors do not terminate the
" last line of the file with an EOL. SIGH
augroup automatic_noeol
  au!
  au BufWritePre  * call <SID>TempSetBinaryForNoeol()
  au BufWritePost * call <SID>TempRestoreBinaryForNoeol()
augroup END
 
function! s:TempSetBinaryForNoeol()
  let s:save_binary = &binary
  if ! &eol && ! &binary
    let s:save_view = winsaveview()
    setlocal binary
    if &ff == "dos" || &ff == "mac"
      if line('$') > 1
        undojoin | exec "silent 1,$-1normal! A\<C-V>\<C-M>"
      endif
    endif
    if &ff == "mac"
      undojoin | %join!
      " mac format does not use a \n anywhere, so we don't add one when writing
      " in binary (which uses unix format always). However, inside the outer
      " if statement, we already know that 'noeol' is set, so no special logic
      " is needed.
    endif
  endif
endfunction
 
function! s:TempRestoreBinaryForNoeol()
  if ! &eol && ! s:save_binary
    if &ff == "dos"
      if line('$') > 1
        " Sometimes undojoin gives errors here, even when it shouldn't.
        " Suppress them for now...if you can figure out and fix them instead,
        " please update http://vim.wikia.com/wiki/VimTip1369
        silent! undojoin | silent 1,$-1s/\r$//e
      endif
    elseif &ff == "mac"
      " Sometimes undojoin gives errors here, even when it shouldn't.
      " Suppress them for now...if you can figure out and fix them instead,
      " please update http://vim.wikia.com/wiki/VimTip1369
      silent! undojoin | silent %s/\r/\r/ge
    endif
    setlocal nobinary
    call winrestview(s:save_view)
  endif
endfunction
" END Preserve EOL
