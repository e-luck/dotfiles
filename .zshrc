# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin
export NODE_PATH=/usr/local/lib/node_modules
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

alias mvi="mvim --remote-tab-silent"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"

# z
#. `brew --prefix`/etc/profile.d/z.sh
#function precmd () {
#   z --add "$(pwd -P)"
#}

#if [[ -f ~/.nodebrew/nodebrew ]]; then
#    export PATH=$HOME/.nodebrew/current/bin:$PATH
#    nodebrew use v0.8
#fi
#
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

#alias hub as git
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

#alias git=hubで無効になるgitのサブコマンドの補完を復活させる
compdef hub=git
