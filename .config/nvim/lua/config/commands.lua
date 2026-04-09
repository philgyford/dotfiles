-- Custom commands that are activated by a :Command or keymap
-- (i.e. not autocmds)

-- --------------------------------------------------------------------
-- Display info about all installed Plugins
-- Do :PackList
-- --------------------------------------------------------------------
vim.api.nvim_create_user_command("PackList", function()
	local pack_data = vim.pack.get()
	local plugins = {}
	for _, plugin in ipairs(pack_data) do
		local active = plugin.active and "  ✅" or "  ❌"
		local name = plugin.spec and plugin.spec.name or "Unknown"
		local rev = plugin.rev and string.sub(plugin.rev, 1, 7) or "-"
		local src = plugin.spec and plugin.spec.src or "-"
		table.insert(plugins, { active, name, rev, src })
	end

	-- Sort by plugin name
	table.sort(plugins, function(a, b)
		return a[2] < b[2]
	end)

	-- Make each row into a string, each cell separated by |
	local rows = {}
	for _, plugin_data in ipairs(plugins) do
		table.insert(rows, table.concat(plugin_data, "|"))
	end

	table.insert(rows, 1, "Active|Plugin Name|Revision|Source")
	table.insert(rows, 2, "------|-----------|--------|------")

	vim.print("PLUGIN STATUS\n\n")
	local rows_str = table.concat(rows, "\n") .. "\n"
	local output = vim.fn.system("column -t -s'|'", rows_str)
	vim.print(output)
end, { desc = "List all Plugins" })

vim.keymap.set("n", "<leader>pl", "<cmd>PackList<CR>", { desc = "List all Plugins" })
