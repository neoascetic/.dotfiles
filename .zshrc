export DYLD_FORCE_FLAT_NAMESPACE=1

# plugins' settings
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa foss

ADOTDIR="$HOME/.zsh"
[[ ! -d $ADOTDIR ]] && mkdir -p $ADOTDIR

ANTIGEN_PATH="$ADOTDIR/antigen.zsh"
[[ ! -e $ANTIGEN_PATH ]] &&
    curl -L https://raw.github.com/zsh-users/antigen/master/antigen.zsh > $ANTIGEN_PATH
source $ANTIGEN_PATH

BASE16_SCHEME="tomorrow"
BASE16_SHELL="$ADOTDIR/base16-$BASE16_SCHEME.dark.sh"
[[ ! -e $BASE16_SHELL ]] &&
    curl -L https://raw.github.com/chriskempson/base16-shell/master/base16-$BASE16_SCHEME.dark.sh > $BASE16_SHELL
source $BASE16_SHELL

antigen-use oh-my-zsh

antigen-bundles <<EOBUNDLES
debian
vundle
vi-mode
git
ssh-agent
python
pip
virtualenvwrapper
extract

zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
sharat87/zsh-vim-mode

sindresorhus/pure # theme
EOBUNDLES

antigen-apply

# Customize to your needs...
export PATH=".:$HOME/bin:$PATH"
export CDPATH=".:$HOME/work/:$HOME/src/:$HOME"

export TERM="xterm-256color"

bindkey "^R" history-incremental-search-backward

alias serve="python -m SimpleHTTPServer"
alias autopep="autopep8 -i **/*.py"

alias -g DATE="date +%d.%m.%Y"
alias -g TIME="date +%H:%M"
alias -g A="| ack"

alias -g gvim='gvim --servername $VIM_SERVERNAME --remote-silent'

md5() { echo -n "$1" | md5sum - | cut -d' ' -f1; }
