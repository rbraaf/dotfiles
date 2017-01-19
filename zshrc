source ~/.async.zsh
source ~/.pure.zsh
source ~/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit && compinit
autoload -U promptinit && promptinit

bindkey -e

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
export PATH="/usr/local/sbin:$PATH"

# added by travis gem
[ -f /Users/rbraaf/.travis/travis.sh ] && source /Users/rbraaf/.travis/travis.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
