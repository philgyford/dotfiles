return {

	-- Automatically detect tabstop and shiftwidth
	"NMAC427/guess-indent.nvim",

  -- modular approach: using `require 'path.name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'plugins.blink-cmp',

  require 'plugins.conform',

  require 'plugins.gitsigns',

  require 'plugins.indent-blankline',

  require 'plugins.lspconfig',

  require 'plugins.lualine',

  require 'plugins.telescope',

  require 'plugins.treesitter',

  require 'plugins.treesitter-context',

  require 'plugins.which-key',


  -- Themes
  -- Enable/disable to change default colorscheme

  require 'plugins.catppuccin',

  -- require 'plugins.tokyonight',
}