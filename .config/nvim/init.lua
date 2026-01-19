-- Leader should be set as early as possible
vim.g.mapleader = ","


if vim.g.vscode then
	require("vscode-init")
else
	require("neovim-init")
end
