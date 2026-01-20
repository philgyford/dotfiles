-- Leader should be set as early as possible
vim.g.mapleader = ","


if vim.g.vscode then
	require("init-vscode")
else
	require("init")
end
