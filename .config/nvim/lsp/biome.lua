-- From https://www.reddit.com/r/neovim/comments/1of6lzt/comment/nneqoag/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
--
-- Because the one at https://github.com/neovim/nvim-lspconfig/blob/master/lsp/biome.lua
-- uses lspconfig functions.

---@type vim.lsp.Config
return {
	cmd = function(dispatchers, config)
		local cmd = "biome"
		local local_cmd = (config or {}).root_dir and config.root_dir .. "/node_modules/.bin/biome"
		if local_cmd and vim.fn.executable(local_cmd) == 1 then
			cmd = local_cmd
		end
		return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
	end,
	filetypes = {
		"css",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"typescript",
		"typescriptreact",
	},
	root_markers = {
		"biome.json",
		"biome.jsonc",
		"package-lock.json",
		"yarn.lock",
		"pnpm-lock.yaml",
		"bun.lockb",
		"bun.lock",
		"deno.lock",
	},
	workspace_required = true,
}
