#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export TERM="xterm-256color"

if [[ $TERM_PROGRAM = "Apple_Terminal" ]]; then
    BASE16_SCHEME="tomorrow"
    BASE16_SHELL="$HOME/.base16-$BASE16_SCHEME.dark.sh"
    [[ ! -e $BASE16_SHELL ]] &&
        curl -L https://raw.github.com/chriskempson/base16-shell/master/base16-$BASE16_SCHEME.dark.sh > $BASE16_SHELL
    source $BASE16_SHELL
fi

export EDITOR='vim'

_byobu_sourced=1 . /usr/bin/byobu-launch
