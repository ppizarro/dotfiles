# Themes.
ZSH_THEME="agnoster"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# History.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

unsetopt beep
bindkey -v

# The following lines were added by compinstall
zstyle :compinstall filename '/home/pizarro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Plugins.
plugins=(
    extract
    git
)

# Environment variables.
source ~/.exports

# Oh My Zsh.
source "$ZSH"/oh-my-zsh.sh

# Aliases.
source ~/.aliases

