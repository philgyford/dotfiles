
. ~/Projects/personal/dotfiles/bash/env
. ~/Projects/personal/dotfiles/bash/config
. ~/Projects/personal/dotfiles/bash/aliases
# Using https://starship.rs instead
#. ~/Projects/personal/dotfiles/bash/prompt

# I think adding this stops this appearing on some occasions, like
# when in `pipenv shell`:
#   bash: update_terminal_cwd: command not found
# Copied from /etc/bashrc on macOS Mojave.
[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

eval "$(starship init bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
