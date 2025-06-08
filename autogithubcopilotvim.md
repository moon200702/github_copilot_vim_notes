# Detailed Installation Steps

## 1. Remove Existing Vim and Neovim

```bash
sudo apt remove vim nvim neovim -y
sudo apt autoremove -y
snap remove nvim
```

## 2. Install Dependencies

```bash
sudo apt update
sudo apt install -y git make gcc ncurses-dev curl
```

## 3. Clone and Compile Vim from GitHub

```bash
git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge --enable-python3interp=yes --enable-multibyte
make
sudo make install
```

## 4. Install Node.js using NVM

```bash
# 下載並安裝 nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# 不想重新啟動 shell 時，執行
\. "$HOME/.nvm/nvm.sh"

# 下載並安裝 Node.js
nvm install 22

# 核對 Node.js 版本
node -v # 應會印出 "v22.16.0"
nvm current # 應會印出 "v22.16.0"

# 核對 npm 版本
npm -v # 應會印出 "10.9.2"
```

## 5. Install GitHub Copilot Plugin for Vim

```bash
git clone --depth=1 https://github.com/github/copilot.vim.git ~/.vim/pack/github/start/copilot.vim
```

## 6. Verify Installation

Launch Vim and authenticate Copilot:

```vim
:Copilot setup
```

---

# Automatic Installation Script

Here's a comprehensive and annotated script:

```bash
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
```
