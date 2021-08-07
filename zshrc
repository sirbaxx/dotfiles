export PATH="/usr/local/sbin:$PATH"

alias nmapper="nmap -Pn -p"
alias nmapudp="sudo nmap -sU -p"
alias sp="speedtest-cli"
alias ip="curl -4 icanhazip.com"
alias ip6="curl -6 icanhazip.com"
alias gp="ping 8.8.8.8"
alias ll="ls -laghF"
alias oath="oathtool --base32 --totp"
alias today="date +%Y%m%d"

#set up auto CD
setopt AUTO_CD

#Setup correction of commands and paths
#setopt CORRECT
#setopt CORRECT_ALL

#################### Setup History #############################
SAVEHIST=5000
HISTSIZE=2000
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
###############################################################

# Completions.
#autoload -Uz compinit && compinit
# Case insensitive.
#zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Nicer prompt
#export PS1=$'\n'"%F{029} %*%F{029} %3~ %F{029}"$'\n'"$ "
#export PS1=$'\n'"%F{029} %*%F{029} %3~ %F{029}"$""

#PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
PROMPT='%(?.%F{029}.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
RPROMPT='%*'



# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800
export PATH="/usr/local/opt/libxml2/bin:$PATH"

# Handy Functions

function mkcd() {
    mkdir -p "$@" && cd "$_"
}

# Check the ip of a domain name - old version
function ipcheck() {
    nslookup "$@" | awk '/Address/{print $2}' | sed -n 2p
}

#Check the ip of a domain name
#function ipcheck() {
#    nslookup "$@" | awk '{print $2}' | sed -n 6p | pbcopy
#    pbpaste
#}

#open man page with Preview
function preman() {
    man -t $@ | open -f -a "Preview"
}

#Open mang page with BBEdit
function manbbedit () {
 MANWIDTH=120 MANPAGER='col -bx' man $@ | bbedit --clean --view-top -t "man $@"
 }

source /Users/roybax/.config/broot/launcher/bash/br
