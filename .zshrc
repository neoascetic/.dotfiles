typeset -U path cdpath
path=(. vendor/bin node_modules/.bin /usr/local/bin /usr/local/sbin $path)
cdpath=(. ~ ~/work ~/src $cdpath)

EDITOR=emacs
alias e=$EDITOR
alias vim=e
alias g=git

function ensure!() {
  f="$HOME/.zsh/$1/$2"
  if [[ ! -a $f ]]; then
    mkdir -p $(dirname $f)
    curl -L# https://github.com/$1/raw/master/$2 > $f
  fi
  source $f
}

ensure! sindresorhus/pure async.zsh
ensure! sindresorhus/pure pure.zsh
