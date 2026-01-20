return {
  {
	'nmac427/guess-indent.nvim',
	lazy = false,
	config = function()
		require('guess-indent').setup {}
		-- From https://github.com/NMAC427/guess-indent.nvim/issues/18
		vim.keymap.set('n', '<Tab>g', vim.cmd.GuessIndent, { desc = "GuessIndent (manual)" })
		-- to tabs
		vim.keymap.set('n', '<Tab>t', '<Cmd>set noexpandtab<CR><Cmd>%retab!<CR><Cmd>set tabstop=8<CR>', { noremap = true, desc = "retab to tabs" })
		vim.keymap.set('v', '<Tab>t', "<Cmd>set noexpandtab<CR><Cmd>'<,'>retab!<CR><Cmd>set tabstop=8<CR>", { noremap = true, desc = "retab to tabs" })
		-- to spaces (for the average emacs enjoyer)
		vim.keymap.set('n', '<Tab>s', '<Cmd>set expandtab<CR><Cmd>set tabstop=8<CR><Cmd>%retab!<CR>', { noremap = true, desc = "retab to spaces" })
		vim.keymap.set('v', '<Tab>s', "<Cmd>set expandtab<CR><Cmd>set tabstop=8<CR><Cmd>'<,'>retab!<CR>", { noremap = true, desc = "retab to spaces" })
	end,
  }
}