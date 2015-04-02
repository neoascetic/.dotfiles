alias g='git'
export TERM="xterm-256color"
export EDITOR='vim'
export CDPATH=.:$HOME:$HOME/work:$HOME/src
export PATH=.:vendor/bin:node_modules/.bin:$PATH

[[ ! -f "$HOME/.antigen.zsh" ]] && curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > $HOME/.antigen.zsh
source "$HOME/.antigen.zsh"

antigen bundle chriskempson/base16-shell base16-tomorrow.dark.sh

antigen use prezto
zstyle ':prezto:*:*' color 'yes'
antigen bundle sorin-ionescu/prezto modules/utility
antigen bundle sorin-ionescu/prezto modules/history
antigen bundle sorin-ionescu/prezto modules/directory
antigen bundle sorin-ionescu/prezto modules/completion

antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
