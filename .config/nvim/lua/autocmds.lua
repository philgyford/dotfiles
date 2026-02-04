-- [[ Autocommands ]]
-- See `:help lua-guide-autocommands`
-- Some via https://github.com/Alexis12119/nvim-config/blob/main/lua/config/autocmds.lua

-- Shortcuts
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ====================================================================
-- General Autocommands
-- ====================================================================
local general = augroup("General", { clear = true })

-- --------------------------------------------------------------------
-- Terminal Behavior
-- --------------------------------------------------------------------
-- Disables line numbers in terminal buffers and auto-enters insert mode.
-- Keeps the terminal clean and ready for immediate input.
autocmd("TermOpen", {
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.cmd("startinsert!")
	end,
	group = general,
	desc = "Configure terminal window options",
})

-- --------------------------------------------------------------------
-- Disable Auto Comment on New Line
-- --------------------------------------------------------------------
-- Prevents Neovim from automatically adding comment prefixes
-- when you press <Enter> or "o" on a commented line.
autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = general,
	desc = "Disable automatic comment continuation",
})

-- --------------------------------------------------------------------
-- Equalize Split Sizes on Resize
-- --------------------------------------------------------------------
-- Keeps all split windows evenly sized when resizing the Neovim window.
autocmd("VimResized", {
	callback = function()
		vim.cmd("wincmd =")
	end,
	group = general,
	desc = "Equalize window splits on terminal resize",
})

-- --------------------------------------------------------------------
-- Dynamic Search Highlighting
-- --------------------------------------------------------------------
-- Automatically hides search highlights while typing (insert mode)
-- and shows them again in normal or visual modes.
autocmd("ModeChanged", {
	pattern = "*",
	callback = function()
		local mode = vim.fn.mode()
		if mode:match("i") then
			vim.opt.hlsearch = false -- Hide highlights while typing
		else
			vim.opt.hlsearch = true -- Show them when navigating or searching
		end
	end,
	group = general,
	desc = "Toggle search highlight visibility by mode",
})

-- --------------------------------------------------------------------
-- Enable Soft Wrap and Spellcheck in Text-like Filetypes
-- --------------------------------------------------------------------
-- Enables word wrapping and spell checking for writing-oriented filetypes.
autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "text", "log" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
	group = general,
	desc = "Enable wrap and spellcheck for writing filetypes",
})

-- --------------------------------------------------------------------
-- Highlight when yanking (copying) text
-- --------------------------------------------------------------------
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
	group = augroup("kickstart-highlight-yank", { clear = true }),
	desc = "Highlight when yanking (copying) text",
})

-- --------------------------------------------------------------------
-- Wrap and check for spell in text by filetype.
-- --------------------------------------------------------------------
-- From https://dzx.fr/blog/modern-neovim-config-from-scratch/#treesitter
autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
	group = augroup("wrap_spell", { clear = true }),
	desc = "Wrap and check for spell in text by filetype",
})

-- --------------------------------------------------------------------
-- Go to last location when opening a buffer.
-- --------------------------------------------------------------------
-- From https://dzx.fr/blog/modern-neovim-config-from-scratch/#treesitter
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			-- Protected call to catch errors.
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
	group = augroup("last_loc", { clear = true }),
	desc = "Go to last location when opening a buffer",
})
