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


export HOMEBREW_GITHUB_API_TOKEN=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

#open man page with Preview
function preman() {
    man -t $@ | open -f -a "Preview"
}

#Open mang page with BBEdit
function manbbedit () {
 MANWIDTH=120 MANPAGER='col -bx' man $@ | bbedit --clean --view-top -t "man $@"
 }

