
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Oh My Zsh plugins
plugins=(git docker)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Vi mode
bindkey -v

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH