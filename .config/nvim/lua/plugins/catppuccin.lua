return {
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
      }
      vim.cmd.colorscheme 'catppuccin-mocha' -- latte, frappe, macchiato, mocha
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
