############################################################################
#	Env
############################################################################
# Set the default editor to vim.
export EDITOR=vim

# Avoid succesive duplicates in the bash command history.
export HISTCONTROL=ignoredups

############################################################################
#	To not poluate non-interactive, place between 'env setup' and 'aliases'
############################################################################
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

############################################################################
#	Source
############################################################################
# Add bash aliases.
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_prompt ]; then
	source ~/.bash_prompt
fi

if [ -f ~/.bash_binding ]; then
	source ~/.bash_binding
fi

############################################################################
#	History
############################################################################
# Append to history instead of overwrite
shopt -s histappend
# Ignore redundant or space commands
HISTCONTROL=ignoreboth
# Set time format
HISTTIMEFORMAT='%F %T '
# Multiple commands on one line show up as a single line
shopt -s cmdhist

# Append new history lines, clear the history list, re-read the history list, print prompt.
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -c; history -r"
