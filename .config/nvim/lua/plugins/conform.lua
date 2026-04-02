vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		-- Disable "format_on_save lsp_fallback" for languages that don't
		-- have a well standardized coding style. You can add additional
		-- languages here or re-enable it for the disabled ones.
		local disable_filetypes = { c = true, cpp = true }
		if disable_filetypes[vim.bo[bufnr].filetype] then
			return nil
		else
			return {
				timeout_ms = 500,
				lsp_format = "fallback",
			}
		end
	end,
	formatters_by_ft = {
		-- See the full list of defaults at
		-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#options
		--
		-- Conform can run multiple formatters sequentially
		-- python = { "isort", "black" },
		--
		-- You can use 'stop_after_first' to run the first available formatter from the list
		-- javascript = { "prettierd", "prettier", stop_after_first = true },

		lua = { "stylua" },
		css = { "biome" },
		html = { "biome" },
		javascript = { "biome", "biome-organize-imports" },
		json = { "biome" },
		python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
	},
})

vim.keymap.set("n", "<leader>fo", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })
