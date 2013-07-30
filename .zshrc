# plugins' settings
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa foss

ADOTDIR="$HOME/.antigen"
ANTIGEN_PATH="$ADOTDIR/antigen.zsh"
if [[ ! -e $ANTIGEN_PATH ]]; then
    mkdir -p $ADOTDIR
    curl https://raw.github.com/zsh-users/antigen/master/antigen.zsh > $ANTIGEN_PATH
fi
source $ANTIGEN_PATH

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
EOBUNDLES

antigen-apply

antigen-theme git://gist.github.com/4071928.git bira_venv

# Customize to your needs...
export PATH="$HOME/bin:$PATH"
export CDPATH=".:$HOME/work/:$HOME/src/:$HOME"

export TERM="xterm-256color"

bindkey "^R" history-incremental-search-backward

alias serve="python -m SimpleHTTPServer"
alias autopep="autopep8 -i **/*.py"

alias -g DATE="date +%d.%m.%Y"
alias -g TIME="date +%H:%M"
alias -g A="| ack"

md5() { echo -n "$1" | md5sum - | cut -d' ' -f1; }
