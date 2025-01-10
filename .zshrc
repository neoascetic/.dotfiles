export ZSH="$HOME/.zsh"

# usage: plug! some/repo[:branch] file-to.load ...
function plug!() {
  local arg=("${(@s/:/)1}") && r=$arg[1] && b=${arg[2]:=master}
  local dir="$ZSH/$r/$b"
  [[ -d $dir ]] || git clone --depth=1 --branch=$b https://github.com/$r $dir
  for f in "${@:2}"; do source "$dir/$f"; done
}

typeset -U path cdpath fpath
path=(. $HOME/bin vendor/bin node_modules/.bin /usr/local/bin /usr/local/sbin $path)

# other stuff
VIRTUALENVWRAPPER_PYTHON=python3
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

plug! ohmyzsh/ohmyzsh plugins/dotenv/dotenv.plugin.zsh
plug! sindresorhus/pure:main async.zsh pure.zsh
plug! paulirish/git-open git-open.plugin.zsh
plug! zsh-users/zsh-completions zsh-completions.plugin.zsh
plug! sorin-ionescu/prezto init.zsh
plug! sorin-ionescu/prezto modules/python/init.zsh
plug! sorin-ionescu/prezto modules/docker/init.zsh
plug! asdf-vm/asdf:v0.15.0 asdf.sh

setopt AUTOCD
cdpath=(. ~ ~/work ~/src $cdpath)
fpath=(${ASDF_DIR}/completions $fpath)
export GOPATH=$HOME

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

HISTFILE="$HOME/.zhistory" SAVEHIST=1000 HISTSIZE=1000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_BEEP
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST HIST_SAVE_NO_DUPS

EDITOR=vim
alias e=$EDITOR
alias g=git
alias ls="ls -GF"
alias bclean="find . \( -name '*.pyc' -or -name '*.beam' \) -delete"
