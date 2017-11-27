# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

# add .local to path
export PATH=$HOME/.local/bin:$PATH

# vim
export EDITOR=vim

# autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"

# virtualenv settings (append ctenv command for saving time)
alias acv="source venv/bin/activate;ctenv"

# zsh
alias aczsh="source ~/.zshrc"

# vault
ctenv () {for ev in $(credentials-to-env env | grep -F "`awk '{print $1}' Secretfile`"); do export $ev; done}
# export VAULT_ADDR=
# export VAULT_TOKEN=
# source $HOME/.env_secret

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# ipython
alias ipy="ipython3"

# fzf (fuzzy search)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# utils alias
alias timestamp="date -r"

case `uname` in
    Linux)
        ;;
    Darwin)
        # macport
        export PATH="$PATH:/opt/local/bin"
        export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
        export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
        export DEP_OPENSSL_INCLUDE=`brew --prefix openssl`/include
        # chrome
        export CHROME_PATH="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
        # vim
        alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
        # nvm
        export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        ;;
esac
