
# Load all additional bash config files
for file in ~/dot-files/.{path,bash_prompt,exports,bash_aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;


if [[ "$OSTYPE" =~ ^darwin ]]; then
	file=.bash_osx
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
fi

if [[ "$OSTYPE" =~ ^linux ]]; then
	file=.bash_linux
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
fi

# Append to the history file, don't overwrite it
shopt -s histappend

# Code completion
source /usr/local/etc/bash_completion.d/git-completion.bash
