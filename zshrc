# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(cabal django git mix pip python tmuxinator vagrant)

source $ZSH/oh-my-zsh.sh

# ignore pyc and temporary files during autocompletion, except for ls and rm
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*.swp|*~)"
zstyle ':completion:*:ls:*:(all-|)files' ignored-patterns
zstyle ':completion:*:rm:*:(all-|)files' ignored-patterns

# 256 colors in terminal to make Solarized look better in Vim
export TERM=xterm-256color

export EDITOR='vim'

# preserve color output with less
export LESS=-RFX

# Customize to your needs...
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.cabal/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

export WORKON_HOME=~/v
source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias ack=ack-grep
alias gfo="git fetch origin"
alias gitka="gitk --all"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

export RUST_SRC_PATH="$HOME/Development/Rust/rust/src"
export PATH="$HOME/.cargo/bin:$PATH"

# Allow for running a command AND staying in interactive mode
# see http://www.zsh.org/mla/users/2005/msg00599.html
if [[ $1 == eval ]]
then
    "$@"
    set --
fi
