vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	-- optional, but recommended
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
	close_if_last_window = true,
	default_component_configs = {
		name = {
			use_filtered_colors = false,
		},
	},
	filesystem = {
		filtered_items = {
			visible = true, -- show hidden files by default (H to toggle)
			never_show = {
				"__pycache__",
				".DS_Store",
				".git",
				".ruff_cache",
				".venv",
			},
			never_show_by_pattern = {
				"*.pyc",
				"*.un~",
			},
		},
	},
	window = {
		width = 35,
	},
})

vim.keymap.set("n", "<leader>d", "<cmd>Neotree toggle<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle Neo-tree",
})
