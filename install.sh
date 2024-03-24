#!/bin/bash

# install basic packages
sudo dnf install -y git make python3-pip vim neovim ripgrep alacritty clang

# install rust (cargo package)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install node with nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node

# config git
git config --global user.email "lopezaxel@protonmail.com"
git config --global user.name "Axel C. Lopez"
git config --global pull.rebase false # prefer merge instead of rebase

# install lunarvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

# install alacritty config
cp ./alacritty/alacritty.toml ~/.alacritty.toml

# install tmux config
cp ./tmux.conf ~/.tmux.conf

# install lunarvim config
if ! [[ -d ~/.config/lvim ]]; then
  mkdir ~/.config/lvim
fi
cp -r ./neovim/* ~/.config/lvim/

# install fonts
if ! [[ -d ~/.local/share/fonts ]]; then
  mkdir ~/.local/share/fonts
fi
cp font/* ~/.local/share/fonts
sudo fc-cache -v

# install bashrc config
cat bashrc >> ~/.bashrc
