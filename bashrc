
# Append at the end of ~/.bashrc

# Make terminal prompt colored
export PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\W\[\e[0m\] $ "

# Make lunarvim default editor for all programs
export GIT_EDITOR=lvim
export VISUAL=lvim
export EDITOR="$VISUAL"

# add cargo to PATH
export PATH=$PATH:~/.cargo/bin

# add neovim (installed by bob neovim version manager) to PATH
export PATH=$PATH:~/.local/share/bob/nvim-bin