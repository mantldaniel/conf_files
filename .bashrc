#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/nvm/init-nvm.sh
source /usr/share/git/completion/git-prompt.sh

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='exa -la'

_RED=$(tput setaf 1)
_GREEN=$(tput setaf 2)
_YELLOW=$(tput setaf 3)
_BLUE=$(tput setaf 4)
_RESET=$(tput sgr0)
_BOLD=$(tput bold)

PROMPT_COMMAND='PS1_CMD1=$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR == 1{ split($2, a," ");print a[1]}'"'"')
PS1_CMD2=$(__git_ps1 " (%s)")'
PS1='${_YELLOW}{\D{%d-%m-%y}}{\@}${_RED}[${PS1_CMD1}]\n${_BOLD}${_GREEN}\u@\h:${_BLUE}\w ${PS1_CMD2}> ${_RESET}'
