EDITOR='vim'
CDPATH=.:~:~/work:~/src
PATH=.:vendor/bin:node_modules/.bin:/usr/local/bin:/usr/local/sbin:$PATH

bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

source ~/.fzf.zsh
source ~/.antigen.zsh

antigen use prezto
zstyle ':prezto:*:*' color 'yes'

antigen bundles <<EOBUNDLES
mafredri/zsh-async
sindresorhus/pure
felixr/docker-zsh-completion
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting
sorin-ionescu/prezto modules/utility
sorin-ionescu/prezto modules/history
sorin-ionescu/prezto modules/directory
sorin-ionescu/prezto modules/completion
paulirish/git-open
EOBUNDLES

alias g='git'
