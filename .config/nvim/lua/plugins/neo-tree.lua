return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		config = function()
			require("neo-tree").setup({
				default_component_configs = {
					name = {
						use_filtered_colors = false,
					},
				},
				filesystem = {
					filtered_items = {
						visible = true, -- show hidden files by default (H to toggle)
						never_show = {
							".DS_Store",
							".git",
						},
						never_show_by_pattern = {
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
		end,
	},
}
