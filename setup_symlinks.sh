ln -s $(pwd)/dot_zshrc $HOME/.zshrc

ln -s $(pwd)/git/dot_gitconfig $HOME/.gitconfig
ln -s $(pwd)/git/dot_gitignore_global $HOME/.gitignore_global

ln -s $(pwd)/dot_alacritty.yml $HOME/.alacritty.yml

ln -s $(pwd)/tmux/dot_tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.tmuxp
ln -s $(pwd)/tmux/default.yml $HOME/.tmuxp/default.yml

mkdir -p $HOME/.ssh
ln -s $(pwd)/ssh/config $HOME/.ssh/config
ln -s $(pwd)/ssh/connections $HOME/.ssh/connections

mkdir -p $HOME/.config/nvim
ln -s $(pwd)/neovim/init.lua $HOME/.config/nvim/init.lua
rm $HOME/.config/nvim/lua
ln -s $(pwd)/neovim/lua $HOME/.config/nvim/lua

rm "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
ln -s $(pwd)/spectacle/Shortcuts.json "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
