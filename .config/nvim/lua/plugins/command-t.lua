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

        -- Start from current file and work up to the "SCM root", and
        -- use that as the directory to search within.
        traverse = 'file',
      })
    end,
  }
}