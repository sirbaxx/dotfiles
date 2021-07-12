export PATH="/usr/local/sbin:$PATH"

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

#Handy Functions

function mkcd() {
    mkdir -p "$@" && cd "$_"
}