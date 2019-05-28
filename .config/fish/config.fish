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

fish_vi_key_bindings

export SHELL="/Users/penzo/.brew/bin/fish"
