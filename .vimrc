" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on


" Turn syntax highlighting on
syntax on


" Generic highlight changes
set background=light
colorscheme solarized


" Set the <Leader> for combo commands
let mapleader = ","


" Show nice info in ruler
set ruler
set laststatus=2

" Set standard setting for PEAR coding standards
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab

" Show line numbers by default
set number

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Set the number of undo levels
set undolevels=1000

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Don't request terminal version string (for xterm)
set t_RV=

" Autoclose folds, when moving out of them
set foldclose=all

" Use incremental searching
set incsearch

" Do not highlight search results
set nohlsearch

" Jump 5 lines when running out of the screen
set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" Allow file inline modelines to provide settings
set modeline

" Disable swap files and backups
set nobackup
set nowritebackup
set noswapfile

" Word wrap
set nowrap
set textwidth=0

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:40,%,n~/.viminfo


" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k

" Remap filetab controls
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-t> :tabnew<CR>


" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

" php-doc
source ~/.vim/php-doc.vim
inoremap <C-Q> :call PhpDocSingle()<CR>i
nnoremap <C-Q> :call PhpDocSingle()<CR>
vnoremap <C-Q> :call PhpDocRange()<CR>

" map ,l to piece-wise copying of the line above the current one
imap ,l @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s

" map ,f to display all lines with keyword under cursor and ask which one to jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

" Ctrl-x/q deletes blank line below/above, and Ctrl-j/k inserts.
nnoremap <silent><C-x> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-z> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Easily edit the vimrc file with ,v
nmap <leader>v :tabedit $MYVIMRC<CR>


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif


" JSLint
"set makeprg=cat\ %\ \\\|\ /usr/local/spidermonkey/js\ /home/nick/.vim/js/mylintrun.js\ %
"set errorformat=%f:%l:%c:%m

" omnicomplete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Associate tpl files
autocmd BufEnter *.tpl set filetype=html.js


" Disable phpsyntax based indenting for .php files
au BufRead,BufNewFile *.php		set indentexpr= | set smartindent

" jQuery syntax
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery 

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Enable folding without the use of markers
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview 

" Set font
set gfn=Inconsolata-dz\ 10

" Gvim settings
if has("gui_running")
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T

    " Remove scrollbar
    set guioptions+=LlRrb
    set guioptions-=LlRrb

    " Set size
    set lines=38 columns=160
endif
