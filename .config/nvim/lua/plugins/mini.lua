vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim" },
})

-- Comment/uncomment lines
-- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-comment.md
require("mini.comment").setup({
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = "gc",

		-- Toggle comment on current line
		comment_line = "gcc",

		-- Toggle comment on visual selection
		comment_visual = "gc",

		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
		-- Works also in Visual mode if mapping differs from `comment_visual`
		textobject = "gc",
	},
})

-- Shows notifications in floating window
-- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-notify.md
require("mini.notify").setup()

-- Adds matching brackets, quotes, etc
-- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-pairs.md
require("mini.pairs").setup()

-- Statusline at bottom of screen
-- https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-statusline.md
require("mini.statusline").setup({
	use_icons = true,
})
