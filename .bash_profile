files=(
  $ZDOTDIR/.exports
  $ZDOTDIR/.aliases
  $ZDOTDIR/.initrc
  $HOME/.exports.local
  $HOME/.aliases.local
  $HOME/.initrc.local
)

for file in $files; do
  [ -r ${file} ] && source ${file}
done
