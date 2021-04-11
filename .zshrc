export ZSH_DOT_DIR="${HOME}/.zsh"

# history config (compare with https://www.soberkoder.com/better-zsh-history/)
HISTFILE=~/.zsh_history
HISTSIZE=1000000   # the number of items for the internal history list
SAVEHIST=1000000   # maximum number of items for the history file
HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# some generic options
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt extendedglob nomatch menucomplete
setopt interactive_comments

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down

#######################################################
# PLUGINS
# #####################################################
source "${ZSH_DOT_DIR}/plugin_functions"

#######################################################
# EXPORTS
# #####################################################
export EDITOR='nvim'
# bat as a manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export GOHOME="${HOME}/.go"
export GOPATH="${HOME}/.go"
export PATH=${HOME}/.luarocks/bin:${GOPATH}/.bin:$PATH

#######################################################
# ALIAS
# #####################################################

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias ls="ls --color"
alias la="ls --color -A"
alias ll="ls --color -al"

alias els="exa --icons"
alias ell="exa --icons --long --header --git --git-ignore"
alias ela="exa --icons --long --header --git --all"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vim="nvim"
alias zshconfig="${EDITOR} ~/.zshrc"
alias vimconfig="${EDITOR} ~/.config/nvim/init.lua"
alias whatigot="pacman -Qqe"

# for dotfile management
alias dfcfg='/usr/bin/git --git-dir=$HOME/.dfcfg/ --work-tree=$HOME'

#######################################################
# PROMPT
# #####################################################
SPACESHIP_PROMPT_ADD_NEWLINE=false
eval "$(starship init zsh)"
