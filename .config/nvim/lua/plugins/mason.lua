vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({
	ui = {
		border = "bold", -- See `:h winborder` for options
		width = 0.8,
		height = 0.8,
	},
})
