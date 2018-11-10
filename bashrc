
. ~/Projects/personal/dotfiles/bash/env
. ~/Projects/personal/dotfiles/bash/config
. ~/Projects/personal/dotfiles/bash/prompt
. ~/Projects/personal/dotfiles/bash/aliases

# added by travis gem
[ -f /Users/phil/.travis/travis.sh ] && source /Users/phil/.travis/travis.sh

# I think adding this stops this appearing on some occasions, like
# when in `pipenv shell`:
#   bash: update_terminal_cwd: command not found
# Copied from /etc/bashrc on macOS Mojave.
[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"
