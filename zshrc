export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  kube-ps1  
  kubectl
)

source $ZSH/oh-my-zsh.sh

# Some Kubernetes things
# After the "source Oh My Zsh" line
PROMPT=$PROMPT'$(kube_ps1) '

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias goland='/usr/local/bin/goland'
alias ktl='kubectl'
alias ktx='kubectx'
alias kns='kubens'

export GPG_TTY=$(tty)
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

export WORKON_HOME=~/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/python/libexec/bin:/usr/local/bin:$PATH"

[[ -s "/$HOME/.gvm/scripts/gvm" ]] && source "/$HOME/.gvm/scripts/gvm"

export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/python@3.8/lib"

export PATH="$HOME/.poetry/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Created by `pipx` on 2021-04-05 20:30:31
export PATH="$PATH:/$HOME/.local/bin"
export CERT_PATH=$(python -m certifi)

function set_aws_env() {
    typeset -A AWS_SETTINGS=($(awk -F"=" "/\[$1\]/{ x = NR + 2; next }(NR <= x){ printf \"%s %s \", \$1, \$2 }" ~/.aws/credentials))
    for k v in ${(kv)AWS_SETTINGS}
    do
        export ${k:u}=$v
    done
}
