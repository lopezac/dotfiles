# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# See <https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_(Select_Graphic_Rendition)_parameters> for ANSI codes

# only set for color terminals and if PS1 unchanged
# if [ "$PS1" = "[\u@\h \w]\\$ " -a "${TERM: -5}" = "color" -o -n "${prompt_color_force}" ]; then
    # examples:
    # PROMPT_COLOR=0 # disable colors/attribs
    # PROMPT_COLOR=1 # bold prompt
    # PROMPT_COLOR=2 # dim prompt
    # PROMPT_COLOR=4 # underline prompt
    # PROMPT_COLOR='2;7' # dim reverse video
    # PROMPT_COLOR='42' # green background
    # PROMPT_COLOR='53' # overline separator
    # PROMPT_COLOR='1;33;44' # bold yellow on blue
    # PROMPT_COLOR='1;32' # bold green
    # PROMPT_COLOR='' # unset defaults to green
    PS1='\[\e[${PROMPT_COLOR:-32}m\]\u@\h\[\e[0m\]:\[\e[${PROMPT_COLOR:-32}m\]\W\[\e[0;31m\]${?#0}\[\e[0m\]\$ '
# fi
