#!/bin/bash
set -e

# Remove existing Vim and Neovim
sudo apt remove vim nvim neovim -y
sudo apt autoremove -y
snap remove nvim || true

# Install dependencies
sudo apt update
sudo apt install -y git make gcc ncurses-dev curl

# Clone and build Vim from GitHub
if [ -d "$HOME/vim" ]; then rm -rf "$HOME/vim"; fi
git clone https://github.com/vim/vim.git ~/vim
cd ~/vim/src
./configure --with-features=huge --enable-python3interp=yes --enable-multibyte
make
sudo make install

# Install Node.js using NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source "$HOME/.nvm/nvm.sh"
nvm install 22

# Verify Node.js installation
node -v
npm -v

# Install GitHub Copilot Vim plugin
git clone --depth=1 https://github.com/github/copilot.vim.git ~/.vim/pack/github/start/copilot.vim

# Final instruction
echo "Installation completed. Open Vim and run :Copilot setup to authenticate GitHub Copilot."
