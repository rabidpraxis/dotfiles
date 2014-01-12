#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias v='vim'
alias r='rails'
alias be='bundle exec'
alias z='j'

alias gpg='gpg2'

# Remap directory listing
alias ll='ls -lah'

# Load FASD
eval "$(fasd --init auto)"
