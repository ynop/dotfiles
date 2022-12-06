#!/bin/sh
# .tool-versions hash: {{ include "dot_tool-versions" | sha256sum }}
asdf plugin add python
asdf plugin add nodejs
asdf plugin add java
asdf plugin add lua
asdf plugin add golang

asdf install
