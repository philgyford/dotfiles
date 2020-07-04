dotfiles
========

My system config stuff.

Recently (2020) switched from using bash to zsh, so the bash files probably won't
get many updates from here on.

For each of the files/folders do something like:

    $ ln -s ~/Projects/personal/dotfiles/filename ~/.filename

For Atom, you should also install the "package-sync" Package, which will read
your `.atom/packages.cson` file and install the necessary Packages.

For Visual Studio Code you should do something like this:

    $ ln -s ~Projects/personal/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    $ ln -s ~/Projects/personal/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
