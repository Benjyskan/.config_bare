#	git
alias gst 'git status'
alias ga 'git add'
alias gcmsg 'git commit -m'
alias fix 'vim `git diff --name-only | uniq`'

#	ls
alias l 'ls -la'
alias ll 'ls -l'

alias maked 'make d'
alias norm 'norminette'

#	setup Brew path
export PATH="/Users/penzo/.brew/bin/:/usr/local/bin:$PATH"

#	setup bare git repo
alias config='/usr/bin/git --git-dir=$HOME/.config_bare/ --work-tree=$HOME'

#	setup easy cscope update
alias csup='~/shell_script/gentags.sh'

#	setup to open vim's config files
alias vimconfig='vim ~/.vimrc ~/.vim/plugged/vim-airline/autoload//airline.vim ~/.vim/plugins/cscope_maps.vim'

#	setup vi keybinding
fish_vi_key_bindings

#	restore ctrl-f to accept auto suggestion
function fish_user_key_bindings
	for mode in insert default visual
		bind -M $mode \cf forward-char
	end
end

export SHELL="/Users/penzo/.brew/bin/fish"

	echo "usefull alias:"
	echo "'config [git cmd]' to intereact with the 'dotfile git'"
	echo "'csup' to update cscope database in CWD"
	echo "'vimconfig' to edit vim's config files"
function fish_greeting
end
