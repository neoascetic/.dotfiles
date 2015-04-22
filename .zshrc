export EDITOR='vim'
export TERM="xterm-256color"
export CDPATH=.:~:~/work:~/src
export PATH=.:vendor/bin:node_modules/.bin:$PATH

source ~/.fzf.zsh
source ~/.antigen.zsh

antigen use prezto
zstyle ':prezto:*:*' color 'yes'
antigen bundles <<EOBUNDLES
chriskempson/base16-shell base16-tomorrow.dark.sh
sindresorhus/pure
sorin-ionescu/prezto modules/utility
sorin-ionescu/prezto modules/history
sorin-ionescu/prezto modules/directory
sorin-ionescu/prezto modules/completion
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
EOBUNDLES

bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

alias g='git'
