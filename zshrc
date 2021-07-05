# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# use old history file after switching to Prezto
export HISTFILE=$HOME/.zsh_history

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

export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

[ -s "$HOME/bin/tmuxinator.zsh" ] && . $HOME/bin/tmuxinator.zsh

export RUST_SRC_PATH="$HOME/Development/Rust/rust/src"
export PATH="$HOME/.cargo/bin:$PATH"

# Allow for running a command AND staying in interactive mode
# see http://www.zsh.org/mla/users/2005/msg00599.html
if [[ $1 == eval ]]
then
    "$@"
    set --
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
