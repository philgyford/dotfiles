return {

  -- Completion
  -- https://github.com/saghen/blink.cmp
  require 'plugins.blink-cmp',

  -- Formatter
  -- https://github.com/stevearc/conform.nvim
  require 'plugins.conform',

  -- Git integration for buffers
  -- https://github.com/lewis6991/gitsigns.nvim
  require 'plugins.gitsigns',

  -- Automatic indentation style detection
  -- https://github.com/nmac427/guess-indent.nvim
	require 'plugins.guess-indent',

  -- Indentation guides
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  require 'plugins.indent-blankline',

  -- Configures LuaLS (?)
  -- https://github.com/folke/lazydev.nvim
  require 'plugins.lspconfig',

  -- Statusline
  -- https://github.com/nvim-lualine/lualine.nvim
  require 'plugins.lualine',

  -- Fuzzy finder over lists
  -- https://github.com/nvim-telescope/telescope.nvim
  require 'plugins.telescope',

  -- Installing, updating and removing tree-sitter parsers, and queries for enabling its features
  -- https://github.com/nvim-treesitter/nvim-treesitter
  require 'plugins.treesitter',

  -- Shows context (e.g. the class or function you're in, if it's off the top of the window)
  -- https://github.com/nvim-treesitter/nvim-treesitter-context
  require 'plugins.treesitter-context',

  -- Shows available keybindings in a popup as you type
  -- https://github.com/folke/which-key.nvim
  require 'plugins.which-key',

  ---------------------------------------------------------------------------
  -- Themes
  -- Enable/disable to change default colorscheme

  require 'plugins.catppuccin',

  -- require 'plugins.tokyonight',
}