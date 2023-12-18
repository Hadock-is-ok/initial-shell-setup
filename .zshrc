export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="clean"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1
source $ZSH/oh-my-zsh.sh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
