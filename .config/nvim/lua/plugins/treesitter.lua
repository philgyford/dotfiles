vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

local treesitter = require("nvim-treesitter")

-- List of supported languages:
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
local file_types = {
	"bash",
	"c",
	"diff",
	"html",
	"javascript",
	"jsdoc",
	"json",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"toml",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}

treesitter.setup({})

treesitter.install(file_types)

vim.api.nvim_create_autocmd("FileType", {
	pattern = file_types,
	callback = function()
		-- Syntax highlighting, provided by Neovim
		vim.treesitter.start()

		-- Folds, provided by Neovim
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"

		-- Indentation, provided by nvim-treesitter
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
