export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# add third part program bin to path
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# vim
export EDITOR=vim

# autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"

# virtualenv settings
alias acv="source venv/bin/activate"

# zsh
alias aczsh="source ~/.zshrc"

# vault
ctenv () {for ev in $(credentials-to-env env | grep -F "`awk '{print $1}' Secretfile`"); do export $ev; done}
# export VAULT_ADDR=
# export VAULT_TOKEN=

# ipython
alias ipy="ipython3"

# fzf (fuzzy search)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# utils alias
alias timestamp="date -r"
alias opr="git st|fpp"
alias how="tldr"
alias g="git"
alias gpip="~/.pyenv/shims/pip"
alias gr="go run"
alias gb="go build"
flint () {flake8 `git st | grep -E ".*\.py" |awk '{ print $2 }'|xargs`}
plint () {pylint `git st | grep -E ".*\.py" |awk '{ print $2 }'|xargs`}

# nodejs related
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cnpm="npm --registry=https://registry.npm.taobao.org \
    --cache=$HOME/.npm/.cache/cnpm \
    --disturl=https://npm.taobao.org/dist \
    --userconfig=$HOME/.cnpmrc"

case `uname` in
    Linux)
        export http_proxy='http://127.0.0.1:8118'
        export https_proxy='http://127.0.0.1:8118'
        alias proxy="sudo /usr/sbin/privoxy /etc/privoxy/config&&\
            export https_proxy='http://127.0.0.1:8118'&&\
            export http_proxy='http://127.0.0.1:8118'"
        alias unproxy="unset http_proxy&&unset https_proxy"
        alias ccopy="xclip -sel c <"
        export NVM_NODEJS_ORG_MIRROR="https://npm.taobao.org/mirrors/node"
        ;;
    Darwin)
        source $HOME/.env_secret
        export CHROME_PATH="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
        alias vim="mvim -v"
        alias ccopy="pbcopy <"
        ;;
esac

