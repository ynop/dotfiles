# Load all additional bash config files
for file in ~/dot-files/.{path,bash_prompt,exports,bash_aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;


if [[ "$OSTYPE" =~ ^darwin ]]; then
	file=~/dot-files/.bash_osx
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
fi

if [[ "$OSTYPE" =~ ^linux ]]; then
	file=~/dot-files/.bash_linux
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
fi

# Append to the history file, don't overwrite it
shopt -s histappend

# Code completion
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && source /usr/local/etc/bash_completion.d/git-completion.bash
[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion 

# vi keys
#set -o vi
#bind '"jk":vi-movement-mode'
