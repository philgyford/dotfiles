-- [[ Setting options ]]
-- See `:help vim.o`

-----------------------------------------
-- vim.o settings
-----------------------------------------

vim.o.autoindent = true

-- Enable break indent
vim.o.breakindent = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--	vim.o.clipboard = "unnamedplus"
-- end)

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Default file encoding for new and opened files
vim.o.fileencoding = "utf-8"

-- Ignore case when searching (use smartcase for sensitivity)
vim.o.ignorecase = true

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Sets how neovim will display certain whitespace characters in the editor.
-- See vim.opt.listchars
vim.o.list = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Make line numbers default
vim.o.number = true

-- Use relative line numbers
vim.o.relativenumber = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 3

-- Number of spaces for each step of (auto)indent and >> <<
vim.o.shiftwidth = 4

-- When a bracket is inserted, briefly jump to the matching one.
vim.o.showmatch = true

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Case-insensitive search unless uppercase letters are used
vim.o.smartcase = true

-- Number of spaces for each step of (auto)indent and >> <<
vim.o.softtabstop = 4

-- Configure how new splits should be opened
vim.o.splitbelow = true
vim.o.splitright = true

-- Number of visual spaces per tab
vim.o.tabstop = 4

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250

-----------------------------------------
-- vim.opt settings
-----------------------------------------

-- Change automatically if textwidth is adjusted
vim.opt.colorcolumn = { "+1" }

-- Look for .nvim.lua files in local project directory
vim.opt.exrc = true
vim.opt.secure = true

-- Don't have code folded by default.
-- See plugins/treesitter.lua for a bit more on folding
vim.opt.foldenable = false

-- Don't nest code below this many levels deep (default 20)
vim.opt.foldnestmax = 4

-- Makes the folded line syntax-highlighted.
vim.opt.foldtext = ""

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.opt.listchars = {
	extends = "◀",
	nbsp = "␣",
	precedes = "▶",
	space = "·",
	tab = "» ",
	trail = "✚",
}

-- Text wrapping / line length indicators
vim.opt.textwidth = 79

-- Add patterns of files to ignore when expanding wildcards
-- Disabled just because command-t doesn't use it and I haven't needed it
-- for anyting else yet.
-- vim.opt.wildignore = {'.git', 'node_modules', '*.pyc'}

-- vim: ts=2 sts=2 sw=2 et
