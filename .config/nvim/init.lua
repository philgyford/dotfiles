-- Use , for leader
vim.g.mapleader = ","

-- Use ,t for quickOpen list
vim.keymap.set('n', '<leader>t', function()
  vim.fn.VSCodeNotify('workbench.action.quickOpen')
end, { noremap = true, silent = true })

-- Use ,d for toggling sidebar
vim.keymap.set('n', '<leader>d', function()
  vim.fn.VSCodeNotify('workbench.action.toggleSidebarVisibility')
end, { noremap = true, silent = true })

-- Use ,l to toggle whitespace visibility
vim.keymap.set('n', '<leader>l', function()
  vim.fn.VSCodeNotify('editor.action.toggleRenderWhitespace')
end, { noremap = true, silent = true })

-- Use ,c for toggling commenting current line
vim.keymap.set('n', '<leader>c<Space>', function()
  vim.fn.VSCodeNotify('editor.action.commentLine')
end, { noremap = true, silent = true })

-- Use ,c for toggling commenting of selected lines
vim.keymap.set('x', '<leader>c<Space>', function()
  vim.fn.VSCodeNotify('editor.action.commentLine')
end, { noremap = true, silent = true })

-- Use ,W to split editor downwards
vim.keymap.set('n', '<leader>W', function()
  vim.fn.VSCodeNotify('workbench.action.splitEditorDown')
end, { noremap = true, silent = true })

-- Use ,w to split editor to the right
vim.keymap.set('n', '<leader>w', function()
  vim.fn.VSCodeNotify('workbench.action.splitEditorRight')
end, { noremap = true, silent = true })

-- Use ,aj and ,ak to jump to next/previous problem
vim.keymap.set('n', '<leader>aj', function()
  vim.fn.VSCodeNotify('editor.action.marker.next')
end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ak', function()
  vim.fn.VSCodeNotify('editor.action.marker.prev')
end, { noremap = true, silent = true })

-- Use ,fo to format document
vim.keymap.set('n', '<leader>fo', function()
  vim.fn.VSCodeNotify('editor.action.formatDocument')
end, { noremap = true, silent = true })

-- Use ,ff to open big search panel for finding across files
vim.keymap.set('n', '<leader>ff', function()
  vim.fn.VSCodeNotify('workbench.action.findInFiles')
end, { noremap = true, silent = true })

-- In visual mode, indent and keep selection
vim.keymap.set('x', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('x', '<', '<gv', { noremap = true, silent = true })