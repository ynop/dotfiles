# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install git
brew install vim --with-python3
brew install tmux
brew install cmake
brew install pandoc
brew install carthage

# zathura
brew tap zegervdv/zathura

brew install xquartz
brew install zathura
brew install zathura-pdf-poppler

mkdir -p $(brew --prefix zathura)/lib/zathura
ln -s $(brew --prefix zathura-pdf-poppler)/libpdf-poppler.dylib $(brew --prefix zathura)/lib/zathura/libpdf-poppler.dylib
