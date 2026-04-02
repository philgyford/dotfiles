-------------------------------------------------------------------------------
-- Install plugins

vim.pack.add({
	-- Dependencies:
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	-- Actual Telescope plugin:
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
})

-- Optional dependency: fzf-native
-- After installing you'll need to do this manually:
--      cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim
--      make
if vim.fn.executable("make") == 1 then
	vim.pack.add({
		{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	})
end

-- Optional dependency: devicons
if vim.g.have_nerd_font then
	vim.pack.add({
		{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	})
end

local telescope = require("telescope")

-------------------------------------------------------------------------------
-- Config

telescope.setup({
	defaults = {
		-- See `:help telescope.layout`
		layout_strategy = "flex",
		layout_config = {
			horizontal = { width = 0.9 },
			vertical = { width = 0.9 },
		},
	},
	pickers = {
		find_files = {
			-- Like command-t's display:
			theme = "dropdown",
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
			-- Only show the filenames, not preview of contents:
			previewer = false,
		},
		live_grep = {
			file_ignore_patterns = { "node_modules", ".git", "venv", ".venv" },
			additional_args = function(_)
				-- Make it search hidden files, like all these ones in a .config directory!
				return { "--hidden" }
			end,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

-------------------------------------------------------------------------------
-- Load extensions

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")

-------------------------------------------------------------------------------
-- Keymaps

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>t", builtin.find_files, { desc = "[F]ind [F]ilenames" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]ilenames" })
vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind [N]eovim files" })
