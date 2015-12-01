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
alias top='htop'

alias gpg='gpg2'

alias gclosure='java -jar $HOME/Dropbox/rpLib/OPP/closure-compiler/build/compiler.jar "$@"'

# Remap directory listing
alias ll='ls -lah'

export NPM_PACKAGES="${HOME}/npm-global"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
export TERM=xterm-256color
export VIMPATH=~/.vim

# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Annoying hack to update environment vars to allow for SSH x11 Forwarding
function tmuxa() {
  for name in `tmux ls -F '#{session_name}'`; do
    tmux setenv -g -t $name DISPLAY $DISPLAY #set display for all sessions
  done;
  `tmux attach`
}

# Speed up bootclj startup time
export BOOT_JVM_OPTIONS="-client
-XX:+TieredCompilation
-XX:TieredStopAtLevel=1
-Xmx2g
-XX:+UseConcMarkSweepGC
-XX:+CMSClassUnloadingEnabled
-Xverify:none"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Reference local paths
export PATH="$HOME/usr/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/usr/lib:$LD_LIBRARY_PATH"
export MANPATH="$HOME/usr/man:$MANPATH"

# Load FASD
eval "$(fasd --init auto)"
