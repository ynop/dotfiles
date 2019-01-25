ln -s $(pwd)/.bash_profile $HOME/.bash_profile
ln -s $(pwd)/.gitconfig $HOME/.gitconfig
ln -s $(pwd)/.gitignore_global $HOME/.gitignore_global
ln -s $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/.tmuxgo $HOME/.tmuxgo
ln -s $(pwd)/.vimrc $HOME/.vimrc

rm "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
ln -s $(pwd)/spectacle/Shortcuts.json "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
