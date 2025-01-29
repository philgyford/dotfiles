# Apple Silicon:
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
# Not Apple Silicon:
[ -f "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"
