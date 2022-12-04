#!/bin/sh
# .tool-versions hash: {{ include "~/.tool-versions" | sha256sum }}
asdf plugin add Python
asdf plugin add nodejs
asdf plugin add java
asdf plugin add lua
asdf plugin add golang

asdf install
