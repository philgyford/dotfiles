-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')



-- Keymap helper options
local opts = { noremap = true, silent = true }
local VERTICAL_LINES = 96
local DEFAULT_COLUMNS = 121

-- Default window size (GUI only)
if vim.fn.has('gui_running') == 1 then
  vim.opt.lines = VERTICAL_LINES
  vim.opt.columns = DEFAULT_COLUMNS
end


-- Most of our basic keymaps
local maps = {
  -- Misc things
  [';'] = { cmd = ':', desc = 'Enter command mode', },
  ['<leader>l'] = { cmd = '<cmd>set list!<CR>', desc = 'Toggle invisible characters', },
  ['<leader><space>'] = { cmd = '<cmd>nohlsearch<CR>', desc = 'Clear search highlighting', },
  -- Split, and move cursor to new split
  ['<leader>w'] = { cmd = '<C-w>v<C-w>l', desc = 'Split vertically', },
  ['<leader>W'] = { cmd = '<C-w>s<C-w>j', desc = 'Split horizontally', },
  -- Navigate between splits with Ctrl + h/j/k/l
  ['<C-h>'] = { cmd = '<C-w>h', desc = 'Move to split left', },
  ['<C-j>'] = { cmd = '<C-w>j', desc = 'Move to split down', },
  ['<C-k>'] = { cmd = '<C-w>k', desc = 'Move to split up', },
  ['<C-l>'] = { cmd = '<C-w>l', desc = 'Move to split right', },
  -- Change window sizes
  ['<leader>1'] = {
    cmd = string.format('<cmd>set lines=%d columns=%d<CR>', VERTICAL_LINES, DEFAULT_COLUMNS),
    desc = 'Resize: 1 document  + nerdtree',
  },
  ['<leader>2'] = {
    cmd = string.format('<cmd>set lines=%d columns=217<CR>', VERTICAL_LINES),
    desc = 'Resize: 2 documents + nerdtree',
  },
  ['<leader>3'] = {
    cmd = string.format('<cmd>set lines=%d columns=316<CR>', VERTICAL_LINES),
    desc = 'Resize: 3 documents + nerdtree',
  },
  ['<leader>9'] = {
    cmd = string.format('<cmd>set lines=%d columns=86<CR>', VERTICAL_LINES),
    desc = 'Resize: 1 document',
  },
  ['<leader>0'] = {
    cmd = '<cmd>vertical resize 86<CR>',
    desc = 'Resize: Current vertical split to standard width',
  },
}

-- Apply the above keymaps
for lhs, map in pairs(maps) do
  vim.keymap.set('n', lhs, map.cmd, {
    noremap = true,
    silent = true,
    desc = map.desc,
  })
end

-- Close Lazy.nvim window with ESC key (otherwise it's :close)
local user_grp = vim.api.nvim_create_augroup('LazyUserGroup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lazy',
  desc = 'Quit lazy with <esc>',
  callback = function()
    vim.keymap.set(
      'n',
      '<esc>',
      function() vim.api.nvim_win_close(0, false) end,
      { buffer = true, nowait = true }
    )
  end,
  group = user_grp,
})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})


-- UNUSED THINGS

-- Fold HTML tag (visual select tag, then zf)
-- vim.keymap.set('n', '<leader>ft', 'Vatzf', { noremap = true })

-- Select text that was just pasted
-- vim.keymap.set('n', '<leader>v', 'V`]', { noremap = true })


-- Edit init.lua (formerly .vimrc)
-- vim.keymap.set('n', '<leader>ev', '<cmd>vsplit $MYVIMRC<CR>', opts)

-- Source init.lua
-- vim.keymap.set('n', '<leader>sv', '<cmd>source $MYVIMRC<CR>', opts)



-- vim: ts=2 sts=2 sw=2 et