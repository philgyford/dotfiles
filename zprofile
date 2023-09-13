# Apple Silicon:
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
# Not Apple Silicon:
[ -f "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"

eval "$(pyenv init --path)"

# Created by `pipx` on 2022-04-01 09:24:36
export PATH="$PATH:/Users/phil/.local/bin"

# Activate completions for pipx, 2022-04-01
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
command -v pipx > /dev/null && eval "$(register-python-argcomplete pipx)"
