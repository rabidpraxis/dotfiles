SAVEHIST=100000
bindkey -v

# ===  Load Antigen  ===========================================================
#
source $ZDOTDIR/antigen/antigen.zsh
mkdir -p $ZDOTDIR/.antigen-bundles
export ADOTDIR=$ZDOTDIR/.antigen-bundles

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
command-not-found
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
mafredri/zsh-async
sindresorhus/pure
trapd00r/zsh-syntax-highlighting-filetypes
EOBUNDLES

antigen apply

# Ctrl-R history search
bindkey '^R' history-incremental-search-backward

# up / down history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
  __git_complete g __git_main
fi;

# Defer to bash_profile for the rest of initialization
source $ZDOTDIR/.bash_profile

# Load NVM
export NVM_DIR="$ZDOTDIR/utils/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
