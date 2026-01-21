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

-- Wrap and check for spell in text by filetype.
-- From https://dzx.fr/blog/modern-neovim-config-from-scratch/#treesitter
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('wrap_spell', { clear = true }),
    pattern = { 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Go to last location when opening a buffer.
-- From https://dzx.fr/blog/modern-neovim-config-from-scratch/#treesitter
vim.api.nvim_create_autocmd('BufReadPost', {
    group = vim.api.nvim_create_augroup('last_loc', { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            -- Protected call to catch errors.
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})