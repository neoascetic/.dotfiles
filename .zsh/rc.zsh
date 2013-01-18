# plugins' settings
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa foss

source "$HOME/.zsh/antigen/antigen.zsh"
antigen-lib

antigen-bundles <<EOF
debian

vundle
vi-mode

git

ssh-agent

python
pip
virtualenvwrapper
git://gist.github.com/1522827.git

zsh-users/zsh-syntax-highlighting
EOF

antigen-apply

antigen-theme git://gist.github.com/4071928.git bira_venv

# Customize to your needs...
export PATH="$HOME/bin:$PATH"
export CDPATH=".:$HOME/work/:$HOME/src/:$HOME"
export NODE_PATH="/usr/local/lib/node_modules/"

export TERM="xterm-256color"

bindkey "^R" history-incremental-search-backward

alias serve="python -m SimpleHTTPServer"
alias autopep="autopep8 -i **/*.py"

alias -g DATE="date +%d.%m.%Y"
alias -g TIME="date +%H:%M"
alias -g A="| ack"

md5() { echo -n "$1" | md5sum - | cut -d' ' -f1; }
