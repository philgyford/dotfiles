
-- Only when using Neovim extension in VS Code

-- Leader should be set as early as possible
vim.g.mapleader = ","

local vscode = require("vscode")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Helper to reduce repetition
local function notify(cmd)
  return function()
    vim.fn.VSCodeNotify(cmd)
  end
end

-- =====================
-- VS Code keybindings
-- =====================
--
-- Use ,t for quickOpen list
map('n', '<leader>t', notify('workbench.action.quickOpen'), opts)

-- Use ,d for toggling sidebar
map('n', '<leader>d', notify('workbench.action.toggleSidebarVisibility'), opts)

-- Use ,l to toggle whitespace visibility
map('n', '<leader>l', notify('editor.action.toggleRenderWhitespace'), opts)

-- Use ,c for toggling commenting current line
map('n', '<leader>c<Space>', notify('editor.action.commentLine'), opts)

-- Use ,c for toggling commenting of selected lines
map('x', '<leader>c<Space>', notify('editor.action.commentLine'), opts)

-- Use ,W to split editor downwards
map('n', '<leader>W', notify('workbench.action.splitEditorDown'), opts)

-- Use ,w to split editor to the right
map('n', '<leader>w', notify('workbench.action.splitEditorRight'), opts)

-- Use ,aj and ,ak to jump to next/previous problem
map('n', '<leader>aj', notify('editor.action.marker.next'), opts)
map('n', '<leader>ak', notify('editor.action.marker.prev'), opts)

-- Use ,fo to format document
map('n', '<leader>fo', notify('editor.action.formatDocument'), opts)

-- Use ,ff to open big search panel for finding across files
map('n', '<leader>ff', notify('workbench.action.findInFiles'), opts)

-- Use ,e to focus the file Explorer
map('n', '<leader>e', notify('workbench.view.explorer'), opts)

-- =====================
-- Visual-mode tweaks
-- =====================

-- In visual mode, indent and keep selection
map('x', '>', '>gv', opts)
map('x', '<', '<gv', opts)

-- =====================
-- Undo / redo via VS Code
-- =====================

-- via https://github.com/vscode-neovim/vscode-neovim/issues/1139#issuecomment-1507445201
map("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>", opts)
map("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>", opts)

-- =====================
-- Search results stuff
-- =====================

-- When searching with / put first match in center of screen
-- I THINK - DOESN'T WORK
-- https://github.com/vscode-neovim/vscode-neovim/issues/1909#issuecomment-3150194545

local function center_after(cmd)
  return function()
    vim.cmd("norm! " .. cmd)
    local curline = vim.fn.line(".")
    vscode.call("revealLine", {
      args = { lineNumber = curline, at = "center" },
    })
  end
end

map("n", "*", center_after("*"), opts)
map("n", "n", center_after("n"), opts)
map("n", "N", center_after("N"), opts)
