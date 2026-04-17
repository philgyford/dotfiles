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
autocmd("FileType", {
	pattern = { "gitcommit", "log", "markdown", "plaintext", "text" },
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
autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank()
	end,
	group = augroup("kickstart-highlight-yank", { clear = true }),
	desc = "Highlight when yanking (copying) text",
})

-- --------------------------------------------------------------------
-- Go to last location when opening a buffer.
-- --------------------------------------------------------------------
-- From https://github.com/neovim/neovim/issues/16339#issuecomment-1348133829
autocmd({ "BufWinEnter", "FileType" }, {
	callback = function()
		local ignore_buftype = { "quickfix", "nofile", "help" }
		local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

		if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
			return
		end

		if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
			-- reset cursor to first line
			vim.cmd([[normal! gg]])
			return
		end

		-- If a line has already been specified on the command line, we are done
		--   nvim file +num
		if vim.fn.line(".") > 1 then
			return
		end

		local last_line = vim.fn.line([['"]])
		local buff_last_line = vim.fn.line("$")

		-- If the last line is set and the less than the last line in the buffer
		if last_line > 0 and last_line <= buff_last_line then
			local win_last_line = vim.fn.line("w$")
			local win_first_line = vim.fn.line("w0")
			-- Check if the last line of the buffer is the same as the win
			if win_last_line == buff_last_line then
				-- Set line to last line edited
				vim.cmd([[normal! g`"]])
			-- Try to center
			elseif buff_last_line - last_line > ((win_last_line - win_first_line) / 2) - 1 then
				vim.cmd([[normal! g`"zz]])
			else
				vim.cmd([[normal! G'"<c-e>]])
			end
		end
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

-- Set filetype for .env and .env.* files
autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("env_filetype", { clear = true }),
	pattern = { "*.env", ".env.*" },
	callback = function()
		vim.opt_local.filetype = "sh"
	end,
})

-- Set filetype for .toml files
autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("toml_filetype", { clear = true }),
	pattern = { "*.tomg-config*" },
	callback = function()
		vim.opt_local.filetype = "toml"
	end,
})
