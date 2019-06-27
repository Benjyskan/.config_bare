" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: penzo <marvin@42.fr>                       +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2019/03/25 17:57:53 by penzo             #+#    #+#              "
"    Updated: 2019/06/26 18:36:42 by penzo            ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" ============================================================================ "
"	Basic settings
" ============================================================================ "
syntax on				"set colors
set nu					"display lines number
set colorcolumn=80		"display Norm column
highlight ColorColumn ctermbg=17
highlight CursorLine cterm=none guibg=#303000 ctermbg=235
set timeout timeoutlen=5000 ttimeoutlen=100	"<O> is now instant
set hidden		"buffer thing
set backspace=2 " make backspace work like most other programs
set tabstop=4
set ruler			"shows line number and column"
"set rulerformat=%l\:%c		"better ruler format"
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l\:%c%V%)

"Make vim jump to last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal! g'\"" | endif
endif

command! WQ wq
command! Wq wq
command! W w
command! Q q

"this redirect swp files into ~/.vim/swp_files
set directory^=$HOME/.vim/swp_files//

"autocompletion options
set path+=**
"test for 'find' to ignore certain files
set wildignore+=*.d
set wildignore+=*.o

set wildmenu
"set wildmode=list:full
set wildchar=<Tab>

set ignorecase	"no 'casesensitive' research
set smartcase	"unless pattern contain Maj

set nocompatible	"ignore old Vi
set	wrap			"this wrap around on big line ??

set splitright	"More natural spliting
set sb			"More natural spliting
set showcmd		"show command in status bar
set showmatch	"show matching parentheses

"ctags protection
set tags=./tags;
let g:easytags_dynamic_files = 1
let g:easytags_async = 0
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1

"Buffer and Split
nnoremap <C-c> :bp\|bd #<CR>	"<Ctrl-c> to close buffer without closing split" better use 'gd' macro
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap gd :bp\|bd #<CR>

"source cscope plugins
source ~/.vim/plugins/cscope_maps.vim

" auto source my syntax file
augroup Sourcegroup
	au!
	autocmd Vimenter,Bufenter * source ~/.vimsyntax.vim
	"autocmd Vimenter,Bufenter * source ~/.vimrc "test: Naze, break comment...
augroup END

augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

"Map Y to yank until end of line
no Y y$

"Map U to reverse undo
map U <C-r>

no K i<CR><Esc>

"press gb to naviguate between buffers (Number or name(tab))
nnoremap gb :ls<CR>:b<Space>
nnoremap gl :args<CR>:b<Space>
nnoremap go :find 

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
autocmd FileType c	nnoremap <buffer> <f4> O/*<CR><CR>/<CR><Esc>2kA<Space>
autocmd FileType cpp	nnoremap <buffer> <f4> O/*<CR><BS><BS>/<Esc>O
autocmd FileType make	nnoremap <buffer> <f4> O<Esc>80i#<Esc>yypO#<Tab>
autocmd FileType vim	nnoremap <buffer> <f4> O"<Space><Esc>76A=<Esc>A<Space>"<Esc>yypO"<Tab>

" ============================================================================ "
"	Comment settings
" ============================================================================ "
"this prevent // to recomment the next newline
"https://vi.stackexchange.com/questions/15444/remove-automatic-comment-leader?rq=1
inoremap <silent><expr> <bs> getline('.') =~# '^//\s*$' ? "<c-u>" : "<bs>"

"test auto comment"move me
set formatoptions+=r

"create 42 comments style naturaly
augroup Commentgroup
	au!
	au VimEnter,WinEnter,BufWinEnter * echo "bonsoir"
	au VimEnter,WinEnter,BufWinEnter * set comments=sl:/*,mb:**,elx:*/
augroup END
