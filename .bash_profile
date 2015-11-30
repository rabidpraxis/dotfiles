files=(
  exports
  aliases
)

for file in $files; do
  [ -r "$file" ] && source "$file"
done
