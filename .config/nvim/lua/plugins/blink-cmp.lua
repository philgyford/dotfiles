vim.pack.add({
	-- Optional dependency to provide integration with emoji plugin:
	{ src = "https://github.com/allaman/emoji.nvim" },
	-- Required in order to use the emoji plugin:
	{ src = "https://github.com/saghen/blink.compat" },
	-- The plugin itself:
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- Use lua, rather than the recommended rust fuzzy matcher which needs building:
	fuzzy = { implementation = "lua" },

	keymap = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
		preset = "enter",
	},

	-- Shows a signature help window while you type arguments for a function
	signature = { enabled = true },

	sources = {
		default = { "emoji", "lsp", "path", "snippets", "buffer" },
		providers = {
			emoji = {
				name = "emoji",
				module = "blink.compat.source",
				-- overwrite kind of suggestion
				transform_items = function(cmp, items)
					local kind = require("blink.cmp.types").CompletionItemKind.Text
					for i = 1, #items do
						items[i].kind = kind
					end
					return items
				end,
			},
		},
	},
})
