# dotfiles

My system config stuff. Includes Neovim config (in `.config/nvim/`).

Switched from using bash to zsh in 2020, so the bash files probably won't
get many updates from here on.

For each of the files/folders do something like:

    $ ln -s ~/Projects/personal/dotfiles/filename ~/.filename

--

## Neovim

    $ ln -s ~/Projects/personal/dotfiles/.config/nvim/lua ~/.config/nvim/lua
    $ ln -s ~/Projects/personal/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua

I also had to install at least these things using Homebrew, for various plugins:

    $ brew install ripgrep
    $ brew install tree-sitter-cli
    $ brew install npm  # For emmet-language-server
    $ brew install stylua  # For conform to format lua files

And then:

    $ npm install -g @biomejs/biome  # For Biome formatting HTML, CSS, JS, etc

And after installing the plugins, including Telescope, we need to manually do
this build step for its optional fzf plugin (something Lazy.nvim could do, but
vim.pack can't):

    $ cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim
    $ make

### Adding new plugins

1. Create a new file in `.config/nvim/lua/plugins/`. This should call
   `vim.pack.add()` on the repository URL, and then probably do at least
   `require("<PLUGIN>").setup()`.
2. Then `require()` that file from `.config/nvim/lua/plugins/init.lua`.
3. Either re-open neovim or do `:restart`.

### Checking things are OK

Do `:checkhealth` to get a full report of any problems, or `:checkhealth
<plugin>` for a specific plugin's.

### Adding support for different languages / file types

#### 1. Add a language server

1. Add a config file for it in `.config/nvim/lsp/`. See examples [at
   nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md)
2. In `.config/nvim/lua/config/lsp.lua` require the config and then enable the
   server
3. Use `:Mason` to install the language server.

#### 2. Add treesitter support

1. Ensure it's listed in `file_types` in
   `.config/nvim/lua/pluings/treesitter.lua`.

---

## VS Code

You should do something like this:

    $ ln -s ~/Projects/personal/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    $ ln -s ~/Projects/personal/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

--

## Starship prompt

    $ ln -s ~/Projects/personal/dotfiles/.config/starship.toml ~/.config/starship.toml

--

## Other old notes

For Atom, you should also install the "package-sync" Package, which will read
your `.atom/packages.cson` file and install the necessary Packages. 

--

- Phil Gyford
- phil@gyford.com
- https://www.gyford.com
