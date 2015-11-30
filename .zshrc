SAVEHIST=100000
bindkey -v

# ===  Load Antigen  ===========================================================
#
source antigen/antigen.zsh
mkdir -p .antigen-bundles
export ADOTDIR=$(dirname $0)/.antigen-bundles

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
command-not-found
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
mafredri/zsh-async
sindresorhus/pure
tarruda/zsh-autosuggestions
trapd00r/zsh-syntax-highlighting-filetypes
clvv/fasd
EOBUNDLES

antigen apply

# Ctrl-R history search
bindkey '^R' history-incremental-search-backward

# up / down history search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Automatically list directory contents on `cd`.
auto-ls () {
  emulate -L zsh;
  # explicit sexy ls'ing as aliases arent honored in here.
  hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
}

chpwd_functions=(
  auto-ls
  $chpwd_functions
)

# Enable autosuggestions automatically
zle-line-init() {
  zle autosuggest-start
}

zle -N zle-line-init

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
  __git_complete g __git_main
fi;

# Defer to bash_profile for the rest of initialization
source .bash_profile
