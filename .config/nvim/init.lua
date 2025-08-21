local vscode = require("vscode")

-- Use , for leader
vim.g.mapleader = ","

-- Use ,t for quickOpen list
vim.keymap.set('n', '<leader>t', function()
  vim.fn.VSCodeNotify('workbench.action.quickOpen')
end, { noremap = true, silent = true })

-- Use ,d for toggling sidebar
vim.keymap.set('n', '<leader>d', function()
  vim.fn.VSCodeNotify('workbench.action.toggleSidebarVisibility')
end, { noremap = true, silent = true })

-- Use ,l to toggle whitespace visibility
vim.keymap.set('n', '<leader>l', function()
  vim.fn.VSCodeNotify('editor.action.toggleRenderWhitespace')
end, { noremap = true, silent = true })

-- Use ,c for toggling commenting current line
vim.keymap.set('n', '<leader>c<Space>', function()
  vim.fn.VSCodeNotify('editor.action.commentLine')
end, { noremap = true, silent = true })

-- Use ,c for toggling commenting of selected lines
vim.keymap.set('x', '<leader>c<Space>', function()
  vim.fn.VSCodeNotify('editor.action.commentLine')
end, { noremap = true, silent = true })

-- Use ,W to split editor downwards
vim.keymap.set('n', '<leader>W', function()
  vim.fn.VSCodeNotify('workbench.action.splitEditorDown')
end, { noremap = true, silent = true })

-- Use ,w to split editor to the right
vim.keymap.set('n', '<leader>w', function()
  vim.fn.VSCodeNotify('workbench.action.splitEditorRight')
end, { noremap = true, silent = true })

-- Use ,aj and ,ak to jump to next/previous problem
vim.keymap.set('n', '<leader>aj', function()
  vim.fn.VSCodeNotify('editor.action.marker.next')
end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ak', function()
  vim.fn.VSCodeNotify('editor.action.marker.prev')
end, { noremap = true, silent = true })

-- Use ,fo to format document
vim.keymap.set('n', '<leader>fo', function()
  vim.fn.VSCodeNotify('editor.action.formatDocument')
end, { noremap = true, silent = true })

-- Use ,ff to open big search panel for finding across files
vim.keymap.set('n', '<leader>ff', function()
  vim.fn.VSCodeNotify('workbench.action.findInFiles')
end, { noremap = true, silent = true })

-- In visual mode, indent and keep selection
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true })

-- Use ,e to focus the file Explorer
vim.keymap.set('n', '<leader>e', function()
  vim.fn.VSCodeNotify('workbench.view.explorer')
end, { noremap = true, silent = true })

-- undo/REDO via vscode
-- via https://github.com/vscode-neovim/vscode-neovim/issues/1139#issuecomment-1507445201
if vim.g.vscode then
    vim.keymap.set("n","u","<Cmd>call VSCodeNotify('undo')<CR>")
    vim.keymap.set("n","<C-r>","<Cmd>call VSCodeNotify('redo')<CR>") 
end

-- When searching with / put first match in center of screen
-- I THINK - DOESN'T WORK
-- https://github.com/vscode-neovim/vscode-neovim/issues/1909#issuecomment-3150194545
vim.keymap.set("n", "*", function()
  vim.cmd(":norm! *")
  local curline = vim.fn.line(".")
  vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, { noremap = true, silent = true })

-- When jumping to next match with n put it in center of screen
vim.keymap.set("n", "n", function()
	vim.cmd(":norm! n")
	local curline = vim.fn.line(".")
	vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, { noremap = true, silent = true })

-- When jumping to previous match with N put it in center of screen
vim.keymap.set("n", "N", function()
	vim.cmd(":silent! norm! N")
	local curline = vim.fn.line(".")
	vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, { noremap = true, silent = true })
