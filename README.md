# dotfiles
Using [chezmoi](https://www.chezmoi.io/) to set up dot-files, packages, ...

## Bootstrap
Install chezmoi
``` 
brew install chezmoi
```

Setup from repo
``` 
chezmoi init --apply git@github.com:ynop/dot-files.git
```
## Device Specific
Device specific settings are set in:
```
~/.config/chezmoi/chezmoi.toml
```
e.g.
```
[edit]
command = "nvim"

[data]
terminal_font_size = 15
```
