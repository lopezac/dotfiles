#!/bin/bash

# install bashrc config
cat bashrc >> ~/.bashrc | bash

# install basic packages
sudo dnf install -y git make python3-pip vim ripgrep alacritty clang

# install rust (cargo package)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install neovim with bob (neovim version manager)
cargo install --git https://github.com/MordechaiHadad/bob.git
bob use 0.9.0

# install node with nvm (nodejs version manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node

# config git
git config --global user.email "lopezaxel@protonmail.com"
git config --global user.name "Axel C. Lopez"
git config --global pull.rebase false # prefer merge instead of rebase

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

# install lunarvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

# solve bug lvim not running
# remove -a "$NVIM_APPNAME" from last line at ~/.local/bin/lvim
# source: https://github.com/LunarVim/LunarVim/issues/3612#issuecomment-1379895972 
beforeLastLine=$(( $( cat ~/.local/bin/lvim | wc -l ) - 1 ))
sed -i "$beforeLastLine, $ d" ~/.local/bin/lvim
echo 'nvim -u "$LUNARVIM_BASE_DIR/init.lua" "$@"' >> ~/.local/bin/lvim
