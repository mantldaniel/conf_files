#
# ~/.bashrc
#

. /usr/share/git-core/contrib/completion/git-prompt.sh

_RED=$(tput setaf 1)
_GREEN=$(tput setaf 2)
_YELLOW=$(tput setaf 3)
_BLUE=$(tput setaf 4)
_RESET=$(tput sgr0)
_BOLD=$(tput bold)

PROMPT_COMMAND='PS1_CMD1=$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR == 1{ split($2, a," ");print a[1]}'"'"')
PS1_CMD2=$(__git_ps1 " (%s)")'
PS1='\[${_YELLOW}\]{\D{%d-%m-%y}}{\@}\[${_RED}\][${PS1_CMD1}]\n\[${_BOLD}\]\[${_GREEN}\]\u@\h:\[${_BLUE}\]\w ${PS1_CMD2}> \[${_RESET}\]'
. "$HOME/.cargo/env"


export EDITOR=hx
export VISUAL=hx

source /usr/share/fzf/shell/key-bindings.bash

alias cat="bat --paging=never"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ln="ln -i"

alias dnf-in="sudo dnf install"
alias dnf-up="sudo dnf update"
alias dnf-rm="sudo dnf remove"
alias dnf-sr="dnf search"
alias dnf-clean="sudo dnf autoremove && sudo dnf clean all"

alias ..="cd .."
alias ....="cd ../.."
alias ......="cd ../../.."

alias reload="source ~/.bashrc"

alias bashconf="${EDITOR:-nano} ~/.bashrc"

alias grep="rg --color=auto"

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"

alias lah="ls -lah"

extract() {
    if [ -z "$1" ]; then
        # If no argument is provided
        echo "Usage: extract <file_name>"
        return 1
    fi

    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *.tar.xz)    tar xf "$1"      ;;
            *.tar.zst)   tar --zstd -xf "$1" ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
        return 1
    fi
}
