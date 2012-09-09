" Ensure that our plugins work properly
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
call pathogen#infect()
filetype plugin indent on       " enable detection, plugins and indenting in one step

" Turn syntax highlighting on
syntax on

" Set the <Leader> for combo commands
let mapleader = ","

" Change ctrlp to use ,t
let g:ctrlp_map = '<leader>t'

" Have ctrlp use the directory we're currently in
let g:ctrlp_working_path_mode = 0

" Use fancy symbols
let g:Powerline_symbols = 'fancy'

" Set Taglist width
let Tlist_WinWidth = 50

" VimClojure settings
let vimclojure#ParenRainbow = 1
let vimclojure#ParenRainbowColors = {
    \ '0': "guifg=#268bd2",
    \ '1': "guifg=#2aa198",
    \ '2': "guifg=#859900",
    \ '3': "guifg=#6c71c4",
    \ '4': "guifg=#d75f00",
    \ '5': "guifg=#fdf6e3",
    \ '6': "guifg=#b58900",
    \ '7': "guifg=#cb4b16",
    \ '8': "guifg=#586e75",
    \ '9': "guifg=#dc322f"
    \ }

let vimclojure#FuzzyIndent = 1
let vimclojure#WantNailgun = 1
let vimclojure#SplitPos = "right"

let vimfiles = $HOME . "/.vim"
" There must be a copy of clojure-1.4.0.jar in ~/.vim/lib
let classpath = vimfiles."/lib/*"
let nailgunRoot = vimfiles."/bundle/nailgun"
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#NailgunClient = nailgunRoot."/lib/nailgun/ng"


" Make sure the latex plugin loads properly
"let g:tex_flavor='latex'

" Avoid loading MatchParen plugin
" let loaded_matchparen = 1

" Set color scheme
set background=dark
colorscheme solarized

" Hide buffers instead of closing them
set hidden

" Ignore case when searching
set ignorecase
" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Show line numbers relative to cursor
set relativenumber

" Save undo history
set undofile
set undodir=~/.vim/.vimundo

" Set the number of undo levels
set undolevels=1000

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Disable swap files and backups
set nobackup
set nowritebackup
set noswapfile

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Improve smoothness of redrawing (indicates a fast terminal connection)
" set ttyfast

" Use UTF-8 as the default buffer encoding
set encoding=utf-8

" Underline the current line, for quick orientation
set cursorline

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Always show what mode we're currently editing in
set showmode

" Highlight 80th column
set cc=80

" Jump 5 lines when running out of screen real estate
set scrolljump=5

" Keep 3 lines off the edges of the screen when scrolling
set scrolloff=3

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Ignore files
set wildignore+=.git
set wildignore+=/**/node_modules/**,/**/vendor
set wildignore+=/**/app/public/js/src/dojo-1.6.1,/**/app/public/js/src/dojo-1.6.1-src
set wildignore+=/**/app/public/js/release,/**/app/resource/data/node_connections
set wildignore+=/**/app/public/img/nodes

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"80 - save 80 lines for each register
" :100  - remember 100 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"80,:100,%,n~/.viminfo

" Search/replace "globally" (on a line) by default
set gdefault

" Use incremental searching
set incsearch

" Do not highlight search results
set nohlsearch

" Show line and column number of cursor position in status window
set ruler
set laststatus=2

" Editing settings

" Convert tabs to 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Allow backspacing over everything
set backspace=indent,eol,start

" Word wrap
set nowrap
set textwidth=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Show current git branch
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Disable folding
set nofoldenable

" Set font
set gfn=Inconsolata-dz\ 10

" Disable bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Disable scroll binding
set noscrollbind

" Easily edit the vimrc file with ,ev
nmap <leader>ev :e $MYVIMRC<CR>

" Map ConqueTermSplit to ,cz
nmap <leader>cz :ConqueTermSplit zsh<CR>

" Easier CtrlP commands
nmap <leader>r :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRUFiles<CR>

" Indent cursor in block after {[( characters
inoremap {<CR> {<CR>}<C-O>O
inoremap [<CR> [<CR>]<C-O>O
inoremap (<CR> (<CR>)<C-O>O

" Map Gundo to ,u
nnoremap <leader>u :GundoToggle<CR>

" Remap filetab controls
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-t> :tabnew<CR>
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt

" Remap buffer resize
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Visual shifting
vnoremap < <gv
vnoremap > >gv

" Start vimclojure nailgun server (uses screen.vim to manage lifetime)
nmap <silent> <Leader>ng :execute "ScreenShell java -cp \"" . classpath . ":" . nailgunRoot . "/lib/*" . "\" vimclojure.nailgun.NGServer 127.0.0.1" <cr>

" Bubble lines
nmap <C-A-k> [e
nmap <C-A-j> ]e
vmap <C-A-k> [egv
vmap <C-A-j> ]egv

" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <A-P> P'[v']=
nnoremap <A-p> p'[v']=

" map ,f to display all lines with keyword under cursor and ask which one to jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P

" Alignment mappings
nmap <leader>a= :Tab /=><CR>
vmap <leader>a= :Tab /=><CR>
nmap <leader>a: :Tab /:<CR>
vmap <leader>a: :Tab /:<CR>
nmap <leader>a- :Tab /=<CR>
vmap <leader>a- :Tab /=<CR>

" Jump to matching pairs easily with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" No longer need to press the Shift key for commands
nnoremap ; :

" Alt-x/z deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><A-x> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-z> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Auto-select text that was just pasted in
nnoremap <leader>v V`]

" Vertically split a window and go to it
nnoremap <leader>s <C-w>v<C-w>l

" Easily move between vertical splits
nnoremap H <C-w>h
nnoremap L <C-w>l

" Ack - betterthangrep.com
nnoremap <leader>z :Ack

" Sorts CSS (content between the braces)
nmap <F7> :g#\({\n\)\@<=#.,/}/sort<CR>

fun! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfun

" Autostrip trailing whitespace
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

" Don't display annoying popup every time a file changes
autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Enable folding without the use of markers
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Don't use delimitmate with .clj
au FileType clojure let b:delimitMate_autoclose = 0

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
    set lines=50 columns=177
endif
