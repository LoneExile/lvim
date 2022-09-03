vim.api.nvim_create_user_command("SaveNFormat", function()
	vim.cmd("lua 	require('lvim.lsp.utils').format()")
	vim.cmd("w!")
end, {})
