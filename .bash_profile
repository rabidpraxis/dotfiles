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
export PATH=$PATH:$ZDOTDIR/utils/fasd
eval "$(fasd --init auto)"
