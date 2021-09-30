# vim: noai:ft=sh

mkdir -p $HOME/.config

ln -s config/zsh/.zshrc $HOME/.zshrc
ln -s config/clojure $HOME/.clojure
ln -s config/alacritty/alacritty.yml $HOME/.alacritty.yml
ln -s config/{git,nvim,tmux,ctags} $HOME/.config
