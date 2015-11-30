command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed. Aborting."; exit 1; }
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed. Aborting."; exit 1; }

echo "* Downloading dotfiles"
git clone --quiet https://github.com/rabidpraxis/dotfiles.git
cd dotfiles
git checkout --quiet v2
echo "* Loading submodule dependencies"
git submodule update --quiet --init --recursive
echo "* Installing ZSH deps"
ZDOTDIR=`pwd` zsh
