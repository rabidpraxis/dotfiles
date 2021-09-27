# vim: noai:ft=sh
echo "❯ .dotfiles/.zshrc"

export PATH="/usr/local/bin:$PATH"

SAVEHIST=100000
bindkey -v

export KEYTIMEOUT=20
# bindkey -M viins 'jj' vi-cmd-mode

source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions

# Ctrl-R history search
bindkey '^R' history-incremental-search-backward

zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
  __git_complete g __git_main
fi;
# Defer to bash_profile for the rest of initialization
source $ZDOTDIR/.bash_profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit && compinit
