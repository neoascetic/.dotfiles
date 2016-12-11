EDITOR='emacs'
CDPATH=.:~:~/work:~/src
PATH=.:vendor/bin:node_modules/.bin:/usr/local/bin:/usr/local/sbin:$PATH

alias vim="$EDITOR"
alias g='git'

source ~/.fzf.zsh
source ~/.antigen.zsh

antigen use prezto
zstyle ':prezto:*:*' color 'yes'

antigen bundles <<EOBUNDLES
mafredri/zsh-async
sindresorhus/pure
sorin-ionescu/prezto modules/utility
sorin-ionescu/prezto modules/history
sorin-ionescu/prezto modules/directory
sorin-ionescu/prezto modules/completion
paulirish/git-open
EOBUNDLES
