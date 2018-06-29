[ "$(whoami)" != "root" ] && (
	echo "This program will install configurations for the following programs:"
	echo "Urxvt, Vim, Tmux, I3, ZSH"
	echo "Upgrading to root"
	exec sudo -- "$0" "$@"
)

DIR=$(dirname "$0")


##### COPY DOTFILES TO PROPER LOCATION #####
echo "Copying dotfiles"
cp $DIR/vimrc ~/.vimrc;
cp $DIR/tmux.conf ~/.tmux.conf;
cp $DIR/zshrc ~/.zshrc
cp $DIR/i3conf ~/.i3/config
cp $DIR/Xdefaults ~/.Xdefaults

##### CONFIGURE VIM #####
cd ~/.vim
echo "Adding vim directories"
mkdir backup
mkdir swap
mkdir undo
mkdir -p pack/start
cd pack/start

echo "Cloning vim plugins from github"
git clone https://github.com/w0rp/ale.git
git clone https://github.com/vim-scripts/Arduino-syntax-file
git clone https://github.com/gitgutter/Vim.git
git clone https://github.com/othree/html5-syntax.vim.git
git clone https://github.com/cohama/lexima.vim.git
git clone https://github.com/matze/vim-move.git
git clone git://github.com/digitaltoad/vim-pug.git
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/terryma/vim-smooth-scroll.git

##### FINISHING COMMANDS #####
echo "Setting default shell to zsh"
chsh -s $(which zsh)
echo "Updating packages"
pacman -Syu

cd $DIR
