-- https://github.com/numToStr/Comment.nvim
return {
	{
		"numToStr/Comment.nvim",
		opts = {}, -- default settings
		config = function()
			require("Comment").setup()

			-- === Line comments ===
			-- Normal mode: toggle comment on current line
			vim.keymap.set(
				"n",
				"<leader>c<space>",
				"<Plug>(comment_toggle_linewise_current)",
				{ desc = "Toggle line comment" }
			)

			-- Visual mode: toggle comment on selected lines
			vim.keymap.set(
				"v",
				"<leader>c<space>",
				"<Plug>(comment_toggle_linewise_visual)",
				{ desc = "Toggle line comment selection" }
			)

			-- === Block comments ===
			-- Normal mode: toggle block comment on current line
			vim.keymap.set(
				"n",
				"<leader>b<space>",
				"<Plug>(comment_toggle_blockwise_current)",
				{ desc = "Toggle block comment" }
			)

			-- Visual mode: toggle block comment on selection
			vim.keymap.set(
				"v",
				"<leader>b<space>",
				"<Plug>(comment_toggle_blockwise_visual)",
				{ desc = "Toggle block comment selection" }
			)
		end,
	},
}
