function plug!() {
  local arg=("${(@s/:/)1}") && r=$arg[1] && b=${arg[2]:=master}
  local dir="$HOME/.zsh/$r/$b"
  [[ -d $dir ]] || git clone --depth=1 --branch=$b git://github.com/$r $dir
  for f in "${@:2}"; do source "$dir/$f"; done
}

plug! mafredri/zsh-async async.zsh
plug! sindresorhus/pure pure.zsh
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

# register docker's env async
function docker-machine() {
  command docker-machine $@
  if [[ "$1" = "start" ]]; then
    touch /tmp/docker-machine-running
  elif [[ "$1" = "stop" ]]; then
    rm /tmp/docker-machine-running
  fi
}
function docker-env-ready() {
  if (( $2 )); then
    return $(async_job docker-env 'sleep 5; test -e /tmp/docker-machine-running')
  fi
  async_stop_worker docker-env
  eval $(docker-machine env)
}

async
async_start_worker docker-env -u -n
async_register_callback docker-env docker-env-ready
async_job docker-env test -e /tmp/docker-machine-running

# usage: sleep 5; notify
if [[ ! $(lsof -Pi :4321 -sTCP:LISTEN) ]]; then
  function anysound() {
    while true; do
      nc -l 4321 && afplay -v 10 /System/Library/Sounds/Glass.aiff
    done
  }
  anysound > /dev/null &!
fi

alias notify='echo 1 | nc 127.0.0.1 4321'
