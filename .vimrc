set nocompatible	"disable VI compatibility
" ============================================================================ "
"	Vim Plug (plugin manager)
" ============================================================================ "
" install vim-plug (i don't know if it's neccesary)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'junegunn/seoul256.vim'
call plug#end()

" ============================================================================ "
"	Basic settings
" ============================================================================ "
set t_Co=256			"set 256-color in vim
colo seoul256
syntax on				"set colors
filetype plugin indent on	"set [filetype] [plugin] [indent (depending on filetype)]
set nonu
set colorcolumn=80		"display Norm column
highlight ColorColumn ctermbg=17
" i think gui works only in 'gvim'
"highlight CursorLine cterm=none guibg=#303000 ctermbg=235
highlight CursorLine cterm=none ctermbg=235

set timeout timeoutlen=5000 ttimeoutlen=100	"<O> is now instant
set ttimeout
set ttimeoutlen=50	"reduce statusline lag when exiting insert mode

set hidden		"buffer thing

"set backspace=2 " make backspace work like most other programs
set backspace=indent,eol,start

set tabstop=4	"42norm for <Tab>
set laststatus=2	"always show the statusline
set autoindent

"Make vim jump to last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif

"this redirect swp files into ~/.vim/swp_files
set directory^=$HOME/.vim/swp_files//

"autocompletion options
set path+=**
"make 'find' to ignore certain files
set wildignore+=*.d
set wildignore+=*.o

set wildmenu
"set wildmode=list:full
set wildchar=<Tab>

set ignorecase	"no 'casesensitive' research
set smartcase	"unless pattern contain Maj

"set nocompatible	"ignore old Vi
set	wrap			"this wrap around on big line ?? "Annoying

set splitright	"More natural spliting
set sb			"More natural spliting

set formatoptions+=r "Automatically comment on <Enter> in comment

"change windows spliter style
"set fillchars+=vert:\ 
set fillchars+=stl:-,stlnc:-,vert:│
highlight VertSplit ctermfg=0 ctermbg=8

"change 'Search' highlight color
highlight Search ctermfg=0 ctermbg=3*

" ============================================================================ "
"	ctags protection
" ============================================================================ "
set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_async = 0
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1

" ============================================================================ "
"	Autocmd && Source
" ============================================================================ "
source ~/.vim/plugins/cscope_maps.vim
source ~/.vim/plugins/my_airline.vim

augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

" ============================================================================ "
"	Command mapping
" ============================================================================ "
command! WQ wq
command! Wq wq
command! W w
command! Q q

" ============================================================================ "
"	Mapping
" ============================================================================ "
"Map Y to yank until end of line
no Y y$
"Map U to reverse undo
map U <C-r>
"bof
no K i<CR><Esc>

"Buffer/File navigation mapping
nnoremap gb :ls<CR>:b<Space>
nnoremap gl :args<CR>:b<Space>
nnoremap go :find 
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap gd :bp\|bd #<CR>
"Open split on next buffer
nnoremap gv :vs\|bn<CR>
nnoremap gs :sp\|bn<CR>

"Buffer and Split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" <Alt>+[hjkl] move current line
ino ˙ <Esc>V<i
ino ¬ <Esc>V>i
ino ∆ <Esc>ddpi
ino ˚ <Esc> ddkPi
no ˚ ddkP
no ∆ ddp
no ¬ V>
no ˙ V<

" ============================================================================ "
"	Folding setting
" ============================================================================ "
set nofoldenable "will not autofold when opening a file
set	foldmethod=indent
set foldnestmax=1

"fold brackets "i could find a better shortcut
"no \\ zf%
"set foldmethod=marker
"set foldmarker=/*,*/

" ============================================================================ "
"	F? mapping
" ============================================================================ "
" <f1> already maped to 42Header

" press f2 to toggle relative nu
map <f2> :set rnu! <CR>

"show invisible character
map <f3> :set list! <CR>
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

"Map 'mini header' depending on filetype
nnoremap <f4> O"<Space><Esc>76A=<Esc>A<Space>"<Esc>yypO"<Tab>
"autocmd FileType c	nnoremap <buffer> <f4> O/*<CR><BS><BS>/<Esc>O
autocmd FileType c		nnoremap <buffer> <f4> O/*<CR><CR>/<CR><Esc>2kA<Space>
autocmd FileType cpp	nnoremap <buffer> <f4> O/*<CR><BS><BS>/<Esc>O
autocmd FileType make	nnoremap <buffer> <f4> O<Esc>80i#<Esc>yypO#<Tab>
autocmd FileType vim	nnoremap <buffer> <f4> O"<Space><Esc>76A=<Esc>A<Space>"<Esc>yypO"<Tab>
autocmd FileType sh	nnoremap <buffer> <f4> O<Esc>79A#<Esc>yypO#<Tab>

" ============================================================================ "
"	Comment settings
" ============================================================================ "
"This prevent // to recomment the next newline
"https://vi.stackexchange.com/questions/15444/remove-automatic-comment-leader?rq=1
inoremap <silent><expr> <bs> getline('.') =~# '^//\s*$' ? "<c-u>" : "<bs>"

"create 42 comments style naturaly
augroup Commentgroup
	au!
	au VimEnter,WinEnter,BufWinEnter * set comments=sl:/*,mb:**,elx:*/
augroup END

" ============================================================================ "
"	(attempt) Syntax for .cmdex files
" ============================================================================ "
" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set

"match from first '#' to end of line
au BufRead,BufNewFile *.cmdex hi my_comment ctermfg=6 ctermbg=0
au BufRead,BufNewFile *.cmdex syn match my_comment /#.*$/

"match all lines starting with '$'
au BufRead,BufNewFile *.cmdex hi cmd_line ctermfg=2 ctermbg=0
au BufRead,BufNewFile *.cmdex syn match cmd_line /^\s*$.[^#]*/

"match all lines starting with '- '
au BufRead,BufNewFile *.cmdex hi question_line ctermfg=3 ctermbg=0
au BufRead,BufNewFile *.cmdex syn match question_line /^\s*- .[^#]*/
