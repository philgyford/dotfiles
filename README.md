# dotfiles

My system config stuff. Includes Neovim config (in `.config/nvim/`).

Switched from using bash to zsh in 2020, so the bash files probably won't
get many updates from here on.

For each of the files/folders do something like:

    $ ln -s ~/Projects/personal/dotfiles/filename ~/.filename

## Neovim

    $ ln -s ~/Projects/personal/dotfiles/.config/nvim/lua ~/.config/nvim/lua
    $ ln -s ~/Projects/personal/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua

I also had to install at least these things using Homebrew, for various plugins:

    $ brew install ripgrep
    $ brew install tree-sitter-cli
    $ brew install npm  # For emmet-language-server

## VS Code

You should do something like this:

    $ ln -s ~/Projects/personal/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    $ ln -s ~/Projects/personal/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

## Starship promit

    $ ln -s ~/Projects/personal/dotfiles/.config/starship.toml ~/.config/starship.toml


## Other old notes

For Atom, you should also install the "package-sync" Package, which will read
your `.atom/packages.cson` file and install the necessary Packages. 


- Phil Gyford
- phil@gyford.com
- https://www.gyford.com