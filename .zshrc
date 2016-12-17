function plug!() {
  local repo="$HOME/.zsh/$1"
  [[ -d $repo ]] || git clone --depth=1 git://github.com/$1 $repo
  for f in "${@:2}"; do source "$repo/$f"; done
}

plug! sindresorhus/pure async.zsh pure.zsh
plug! paulirish/git-open git-open.plugin.zsh
plug! zsh-users/zsh-completions zsh-completions.plugin.zsh

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

setopt AUTOCD
typeset -U path cdpath fpath
cdpath=(. ~ ~/work ~/src $cdpath)
path=(. vendor/bin node_modules/.bin /usr/local/bin /usr/local/sbin $path)

HISTFILE="$HOME/.zhistory" SAVEHIST=1000 HISTSIZE=1000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_BEEP
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_SAVE_NO_DUPS

EDITOR=emacs
alias e=$EDITOR vim=e
alias g=git
alias ls="ls -GF"
