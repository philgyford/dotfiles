# Must come before zsh/config, where we use it:
. ~/Projects/personal/dotfiles/zsh/zsh-history-substring-search

. ~/Projects/personal/dotfiles/zsh/env
. ~/Projects/personal/dotfiles/zsh/config
. ~/Projects/personal/dotfiles/zsh/aliases

# Using https://starship.rs instead
# . ~/Projects/personal/dotfiles/zsh/prompt_git
# . ~/Projects/personal/dotfiles/zsh/prompt

eval "$(starship init zsh)"