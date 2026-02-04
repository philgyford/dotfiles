-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!"<CR>')

-- Keep blocks selected when in/outdenting
vim.keymap.set("v", "<", "<gv", { desc = "Outdent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

-- Make cmd-S save file, because of my muscle memory
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<CR><esc>", { desc = "Save file" })

-- Keymap helper options
local VERTICAL_LINES = 96
local DEFAULT_COLUMNS = 121

-- Default window size (GUI only)
if vim.fn.has("gui_running") == 1 then
	vim.opt.lines = VERTICAL_LINES
	vim.opt.columns = DEFAULT_COLUMNS
end

-- Make cmd-c and cmd-v work within Neovide app
if vim.g.neovide then
	local function save()
		vim.cmd.write()
	end
	local function copy()
		vim.cmd([[normal! "+y]])
	end
	local function paste()
		vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
	end

	vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
	vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
	vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })
end

-- Most of our basic keymaps
local maps = {
	-- Misc things
	[";"] = { cmd = ":", desc = "Enter command mode" },
	["<leader>l"] = { cmd = "<cmd>set list!<CR>", desc = "Toggle invisible characters" },
	["<leader><space>"] = { cmd = "<cmd>nohlsearch<CR>", desc = "Clear search highlighting" },
	["<space>"] = { cmd = "za", desc = "Fold current line" },
	["U"] = { cmd = "<C-r>", desc = "Redo" },
	-- e.g. for the :Lazy window:
	["<esc>"] = { cmd = "<cmd>fc<CR>", desc = "Close floating window" },
	-- Change tabs/spaces as needed:
	-- Split, and move cursor to new split
	["<leader>w"] = { cmd = "<C-w>v<C-w>l", desc = "Split vertically" },
	["<leader>W"] = { cmd = "<C-w>s<C-w>j", desc = "Split horizontally" },
	-- Navigate between splits with Ctrl + h/j/k/l
	["<C-h>"] = { cmd = "<C-w>h", desc = "Move to split left" },
	["<C-j>"] = { cmd = "<C-w>j", desc = "Move to split down" },
	["<C-k>"] = { cmd = "<C-w>k", desc = "Move to split up" },
	["<C-l>"] = { cmd = "<C-w>l", desc = "Move to split right" },
	-- Change window sizes
	["<leader>1"] = {
		cmd = string.format("<cmd>set lines=%d columns=%d<CR>", VERTICAL_LINES, DEFAULT_COLUMNS),
		desc = "Resize: 1 doc + neo-tree",
	},
	["<leader>2"] = {
		cmd = string.format("<cmd>set lines=%d columns=217<CR>", VERTICAL_LINES),
		desc = "Resize: 2 docs + neo-tree",
	},
	["<leader>3"] = {
		cmd = string.format("<cmd>set lines=%d columns=316<CR>", VERTICAL_LINES),
		desc = "Resize: 3 docs + neo-tree",
	},
	["<leader>9"] = {
		cmd = string.format("<cmd>set lines=%d columns=86<CR>", VERTICAL_LINES),
		desc = "Resize: 1 doc",
	},
	["<leader>0"] = {
		cmd = "<cmd>vertical resize 86<CR>",
		desc = "Resize: Current vertical split to standard width",
	},
}

-- Apply the above keymaps
for lhs, map in pairs(maps) do
	vim.keymap.set("n", lhs, map.cmd, {
		noremap = true,
		silent = true,
		desc = map.desc,
	})
end

-- INDENTATION --
-- Functions to set indentation
local function set_indent(ts, sts, sw, expandtab)
	vim.opt.tabstop = ts -- number of spaces that a <Tab> counts for
	vim.opt.softtabstop = sts -- number of spaces when editing
	vim.opt.shiftwidth = sw -- number of spaces used for autoindent
	vim.opt.expandtab = expandtab
end
-- Keymaps to toggle indentation
vim.keymap.set("n", "\\t", function()
	set_indent(2, 2, 2, false)
end, { desc = "Tabs, 2 spaces" })
vim.keymap.set("n", "\\T", function()
	set_indent(4, 4, 4, false)
end, { desc = "Tabs, 4 spaces" })
vim.keymap.set("n", "\\s", function()
	set_indent(2, 2, 2, true)
end, { desc = "Spaces, 2 spaces" })
vim.keymap.set("n", "\\S", function()
	set_indent(4, 4, 4, true)
end, { desc = "Spaces, 4 spaces" })

-- UNUSED THINGS

-- Fold HTML tag (visual select tag, then zf)
-- vim.keymap.set('n', '<leader>ft', 'Vatzf', { noremap = true })

-- Select text that was just pasted
-- vim.keymap.set('n', '<leader>v', 'V`]', { noremap = true })

-- Edit init.lua (formerly .vimrc)
-- vim.keymap.set('n', '<leader>ev', '<cmd>vsplit $MYVIMRC<CR>', opts)

-- Source init.lua
-- vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<CR>', opts)

-- vim: ts=2 sts=2 sw=2 et
