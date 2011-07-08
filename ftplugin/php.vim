let PHP_autoformatcomment = 1

" Auto indent after a {
setlocal autoindent
setlocal smartindent

" Linewidth to 79, because of the formatoptions this is only valid for comments
set formatoptions=qrocb

" Correct indentation after opening a phpdocblock and automatic * on every
" line
setlocal formatoptions=qroct

" Use php syntax check when doing :make
setlocal makeprg=php\ -l\ %

" Use errorformat for parsing PHP error output
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Use pman for manual pages
setlocal keywordprg=pman

" More common in PEAR coding standard
" inoremap <buffer>  { {<CR>}<C-O>O
" Maybe this way in other coding standards
inoremap  { {<CR>}<C-O>O

inoremap <buffer> [ []<LEFT>

" Standard mapping after PEAR coding standard
"inoremap <buffer> ( (  )<LEFT><LEFT>
" Maybe this way in other coding standards
"inoremap ( ()<LEFT>

"inoremap <buffer> " ""<LEFT>
"inoremap <buffer> ' ''<LEFT>

:vnoremap <buffer> ( "zdi(<C-R>z)<ESC>
:vnoremap <buffer> { "zdi{<C-R>z}<ESC>
:vnoremap <buffer> [ "zdi[<C-R>z]<ESC>
:vnoremap <buffer> ' "zdi'<C-R>z'<ESC>
