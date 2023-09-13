# Must come before zsh/config, where we use it:
. ~/Projects/personal/dotfiles/zsh/zsh-history-substring-search

. ~/Projects/personal/dotfiles/zsh/env
. ~/Projects/personal/dotfiles/zsh/config
. ~/Projects/personal/dotfiles/zsh/aliases

# Using https://starship.rs instead
# . ~/Projects/personal/dotfiles/zsh/prompt_git
# . ~/Projects/personal/dotfiles/zsh/prompt

eval "$(starship init zsh)"


# START functions needed for Hactar project

function gofab {
    if [ -d "fabfile" ]; then
        if [ -d "fabfile/.venv" ]; then
            pushd fabfile > /dev/null
            pipenv shell
            popd > /dev/null
        else
            export PIPENV_VENV_IN_PROJECT=1
            pushd fabfile > /dev/null
            pipenv --three
            pipenv install
            pipenv shell
            popd > /dev/null
        fi
    else
        echo "Didn't find a fabfile folder, run gofab from your project root"
    fi
    if [ -n "${BASH-}" ] || [ -n "${ZSH_VERSION-}" ] ; then
        hash -r 2>/dev/null
    fi
}

function goenv {
    export $(grep -v '^#' .env | xargs)
    eval $(envkey-source)
}

# END functions needed for Hactar project
# Created by `pipx` on 2022-04-01 09:24:36
export PATH="$PATH:/Users/phil/.local/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
