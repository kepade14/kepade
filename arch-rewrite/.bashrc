#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#change bash by my own
alias ls='ls --color=auto'
alias cat='cat |lolcat'
alias check='du -sh ~/*'
alias xx='./.xx'
alias cn='./.cn'
alias up='pacaur -Syu &&pacaur -Scc'
