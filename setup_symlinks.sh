ln -s $(pwd)/.zshrc $HOME/.zshrc

ln -s $(pwd)/git/.gitconfig $HOME/.gitconfig
ln -s $(pwd)/git/.gitignore_global $HOME/.gitignore_global

ln -s $(pwd)/.alacritty.yml $HOME/.alacritty.yml

mkdir -p $HOME/.ssh
ln -s $(pwd)/ssh/config $HOME/.ssh/config
ln -s $(pwd)/ssh/connections $HOME/.ssh/connections

mkdir -p $HOME/.config/nvim
ln -s $(pwd)/neovim/init.vim $HOME/.config/nvim/init.vim

rm "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
ln -s $(pwd)/spectacle/Shortcuts.json "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
