-- Enable language servers

-- Set up the config for each one, requiring its file in lsp/ directory
vim.lsp.config("lua_ls", require("lsp.lua_ls"))

-- Enable each one here
vim.lsp.enable({
	"lua_ls",
})

vim.diagnostic.config({ virtual_text = true })
