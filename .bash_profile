# Ensure local path is avaliable to all scripts
export PATH="/usr/local/bin:$PATH"

files=(
  $ZDOTDIR/.exports
  $ZDOTDIR/.aliases
  $ZDOTDIR/.functions
  $ZDOTDIR/.initrc
  $HOME/.exports.local
  $HOME/.aliases.local
  $HOME/.initrc.local
)

for file in $files; do
  [ -r ${file} ] && source ${file}
done
