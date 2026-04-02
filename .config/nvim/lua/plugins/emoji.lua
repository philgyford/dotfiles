vim.pack.add({
	-- Dependencies:
	-- util for handling paths
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	-- optional for nvim-cmp integration
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	-- optional for telescope integration
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	-- optional for fzf-lua integration via vim.ui.select
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	-- The actual plugin itself:
	{ src = "https://github.com/allaman/emoji.nvim" },
})

require("emoji").setup({
	-- default is false, also needed for blink.cmp integration!
	enable_cmp_integration = true,
	-- optional if your plugin installation directory
	-- is not vim.fn.stdpath("data") .. "/lazy/
	-- plugin_path = vim.fn.expand("$HOME/plugins/"),
	plugin_path = vim.fn.expand("$HOME/.local/share/nvim/site/pack/core/opt/"),
})

local ts = require("telescope").load_extension("emoji")
vim.keymap.set("n", "<leader>fe", ts.emoji, { desc = "[F]ind [E]moji" })
