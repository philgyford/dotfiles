-- Leader should be set as early as possible
vim.g.mapleader = ","
vim.g.maplocalleader = ","

if vim.g.vscode then
	-- For when we're using the Neovim plugin in VS Code,
	-- use the one config file that's for that:
	require("vscode-only")
else
	-- For all other Neovims, everything else:
	require("config")
	require("plugins")
end
