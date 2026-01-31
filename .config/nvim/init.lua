-- Leader should be set as early as possible
vim.g.mapleader = ","


if vim.g.vscode then
  -- For when we're using the Neovim plugin in VS Code,
  -- use the one config file that's for that:
  require("init-vscode")
else
  -- For all other Neovims, everything else:
  require("init")
end
