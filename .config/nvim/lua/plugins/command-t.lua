-- Fuzzy file finder and opener

return {
  {
    'wincent/command-t',
    keys = {
      {
        -- Ripgrep version ignores files like .pyc:
        "<leader>t", "<cmd>CommandTRipgrep<CR>"
      },
    },
    build = 'cd lua/wincent/commandt/lib && make',
    config = function()
      require('wincent.commandt').setup({
        -- Customizations go here
      })
    end,
  }
}