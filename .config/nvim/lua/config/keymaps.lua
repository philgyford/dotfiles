-- Much based on https://tduyng.com/blog/neovim-basic-setup/

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- For adding a desc to our table of common opts, for brevity.
local function with_desc(desc)
	return vim.tbl_extend("force", opts, { desc = desc })
end

map("n", ";", ":", opts)

-- Better up/down
-- e.g. j moves down visually but 5j moves down 5 actual lines
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
-- Disable arrow keys
map("n", "<left>", '<cmd>echo "Use h to move left!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move right!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move up!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move down!"<CR>')

-- Resize windows/buffers with Ctrl+Cmd+arrow keys (macOS)
map("n", "<C-S-Up>", "<cmd>resize +5<CR>", opts)
map("n", "<C-S-Down>", "<cmd>resize -5<CR>", opts)
map("n", "<C-S-Left>", "<cmd>vertical resize -5<CR>", opts)
map("n", "<C-S-Right>", "<cmd>vertical resize +5<CR>", opts)

-- Goto start/end of lines.
map("n", "==", "gg<S-v>G", { desc = "Select all" })
map("n", "gl", "$", { desc = "Go to end of line" })
map("n", "gh", "^", { desc = "Go to start of line" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Save file with cmd-S, for muscle memory
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<CR><esc>", { desc = "Save file" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Make split and move to the new split.
map("n", "<leader>w", "<C-w>v<C-w>l", with_desc("Split vertically"))
map("n", "<leader>W", "<C-w>s<C-w>j", with_desc("Split horizontally"))
--
-- Move to different windows/splits
map("n", "<C-h>", "<C-w>h", { desc = "Move to split left", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Move to split down", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Move to split up", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Move to split right", remap = true })

-- ------------------------------------------------------------------------- }}}

-- Folding
map("n", "<space>", "za", with_desc("Fold current line"))

-- Undo/redo
map("n", "U", "<C-r>", with_desc("Redo"))

map("n", "<esc>", "<cmd>fc<CR>", with_desc("Close floating window"))

-- Better paste
-- remap "p" in visual mode to delete the highlighted text without overwriting your yanked/copied text, and then paste the content from the unnamed register.
map("v", "p", '"_dP', opts)

-- Make cmd-* copy/paste/cut use system clipboard:
-- Copy (Cmd+C)
map("v", "<D-c>", '"+y')
map("n", "<D-c>", '"+yy')
-- Paste (Cmd+V)
map({ "n", "v", "i" }, "<D-v>", '"+p')
-- Cut (Cmd+X)
map("v", "<D-x>", '"+d')
map("n", "<D-x>", '"+dd')
-- Insert clipboard content cleanly without leaving insert mode:
map("i", "<D-v>", "<C-r>+")

-- Development
-- Jump to next/previous linter error/warning
map("n", "]g", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "[g", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Toggle wrap
map("n", "<leader>tw", "<cmd>set wrap!<CR>", {
	desc = "Toggle Wrap",
	silent = true,
})

-- vim.pack keymaps
map("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>", { desc = "Update all Plugins" })
map("n", "<leader>pd", function()
	vim.ui.input({ prompt = "Plugin name to delete: " }, function(input)
		if input and input ~= "" then
			pcall(vim.pack.del, { input })
		end
	end)
end, { desc = "Delete Plugin" })

-- WINDOW RESIZING
-- Keymap helper options
local VERTICAL_LINES = 96
local DEFAULT_COLUMNS = 121

-- Default window size (GUI only)
if vim.fn.has("gui_running") == 1 then
	vim.opt.lines = VERTICAL_LINES
	vim.opt.columns = DEFAULT_COLUMNS
end

map(
	"n",
	"<leader>1",
	string.format("<cmd>set lines=%d columns=%d<CR>", VERTICAL_LINES, DEFAULT_COLUMNS),
	with_desc("Resize: 1 doc + neo-tree")
)
map(
	"n",
	"<leader>2",
	string.format("<cmd>set lines=%d columns=217<CR>", VERTICAL_LINES),
	with_desc("Resize: 2 docs + neo-tree")
)
map(
	"n",
	"<leader>3",
	string.format("<cmd>set lines=%d columns=316<CR>", VERTICAL_LINES),
	with_desc("Resize: 3 docs + neo-tree")
)
map("n", "<leader>9", string.format("<cmd>set lines=%d columns=86<CR>", VERTICAL_LINES), with_desc("Resize: 1 doc"))
map("n", "<leader>0", "<cmd>vertical resize 86<CR>", with_desc("Resize: Current vertical split to standard width"))

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

-- Runs :restart and maintains the window layout, buffers, and cursor position.
-- via https://www.reddit.com/r/neovim/comments/1shks8o/nvim_012s_new_restart_command_is_nice/
vim.keymap.set("n", "<leader>R", function()
	local session = vim.fn.stdpath("state") .. "/restart_session.vim"
	vim.cmd("mksession! " .. vim.fn.fnameescape(session))
	vim.cmd("restart source " .. vim.fn.fnameescape(session))
end, { desc = "Restart Neovim" })
