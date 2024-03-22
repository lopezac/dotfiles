#!/bin/bash

# install basic packages
sudo dnf install -y git cargo make python3-pip vim neovim ripgrep

# install node with nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node

# config git
git config --global user.email "lopezaxel@protonmail.com"
git config --global user.name "Axel C. Lopez"

# install lunarvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

# install alacritty config
cp alacritty/alacritty.toml ~/.alacritty.toml

# install tmux config
cp tmux/.tmux.conf ~/.tmux.conf

# install lunarvim config
if ! ls ~/.config/lvim; then
  mkdir ~/.config/lvim
fi
cp lunarvim/* ~/.config/lvim/

# install fonts
if ! ls ~/.local/share/fonts; then
  mkdir ~/.local/share/fonts
fi
cp fonts/* ~/.local/share/fonts
sudo fc-cache -v

# install bashrc config
cat bash/.bashrc >> ~/.bashrc
