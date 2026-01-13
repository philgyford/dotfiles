-- Leader should be set as early as possible
vim.g.mapleader = ","


if vim.g.vscode then
	require("vscode_config")
else
	require("neovim")
end
