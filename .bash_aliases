###############################################################################
#	CD
###############################################################################
alias ..='cd ..'
#alias '-'='cd -'		#nop

############################################################################
#	LS
############################################################################
alias ls='ls -F --color=auto'

#check if coreutils if installed && use it instead
#test -d /usr/local/Cellar/coreutils && alias ls='gls -F --color=auto' #for macbook
#test -d /Users/penzo/.brew/Cellar/coreutils/ && alias ls='gls -F --color=auto' #for 42's imac
if [ `uname -n | cut -d. -f2 -f3` = "42.fr" ]; then
	test -d /Users/penzo/.brew/Cellar/coreutils/ && alias ls='gls -F --color=auto' #for 42's imac
else
	test -d /usr/local/Cellar/coreutils && alias ls='gls -F --color=auto' #for macbook
fi

alias ll='ls -oh --group-directories-first'
alias l='ll -A'
#Expand current directory structure in tree form
alias treed="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias lst='treed'

############################################################################
#	GIT
############################################################################
alias gst='git status'
alias ga='git add'
alias gcmsg='git commit -m'
alias fix='vim `git diff --name-only | uniq`'
#alias for  bare git repo
alias config='/usr/bin/git --git-dir=$HOME/.config_bare/ --work-tree=$HOME'
alias gitlog='git log --graph --oneline --all --decorate --pretty="%C(bold)%ad%C(reset) %C(yellow)%h%C(reset) %an %C(blue)%s" --date=format:"%y/%m/%d"'

###############################################################################
#	Python
###############################################################################
alias python=python3
alias pip=pip3

############################################################################
#	Functions
############################################################################
take() {
	[[ "$1" ]] \
		&& mkdir -p "$1" \
		&& cd "$1";
}

############################################################################
#	Other...
############################################################################
alias grep='grep --color=auto --exclude-dir=\.svn'
#open bash config files
alias bashconfig='vim ~/.bashrc ~/.bash_prompt ~/.bash_aliases ~/.bash_binding'
#open vim config files
alias vimconfig='vim ~/.vimrc ~/.vim/plugins/cscope_maps.vim ~/.vim/plugins/my_airline.vim'
#setup easy cscope update
alias csup='~/shell_script/gentags.sh'
