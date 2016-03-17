command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed. Aborting."; exit 1; }
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed. Aborting."; exit 1; }

echo "* Downloading dotfiles"
echo "* Loading submodule dependencies"
git clone --quiet --recursive https://github.com/rabidpraxis/dotfiles.git

cd dotfiles

echo "* Installing ruby-build"
mkdir -p utils/rbenv/plugins
ln -s ../../ruby-build/ utils/rbenv/plugins/
ln -s ../../rbenv-ctags/ utils/rbenv/plugins/

echo "* Installing ZSH deps"
# Note: I have to inject this into the new zsh to keep this init script running
ZDOTDIR=`pwd` zsh <<'EOF'
echo "* Install VIM deps"
VIMPATH=vim vim -u vim/vimrc +PluginInstall +qall

echo "* Ready to rawk"
EOF

ZDOTDIR=`pwd` zsh
