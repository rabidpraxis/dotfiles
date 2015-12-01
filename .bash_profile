files=(
  $ZDOTDIR/.exports
  $ZDOTDIR/.aliases
  $HOME/.exports.local
  $HOME/.aliases.local
)

for file in $files; do
  [ -r ${file} ] && source ${file}
done

# Load fasd
eval "$($ZDOTDIR/utils/fasd/fasd --init auto)"
