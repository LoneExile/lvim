-- require("hop").setup()

local status_ok_code, hop = pcall(require, "hop")
if not status_ok_code then
	vim.notify("hop" .. " not found!")
	return
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gh", "<cmd>HopAnywhere<CR>", opts)

local config = {
	-- create_hl_autocmd = false,
	-- uppercase_labels = true,
	multi_windows = true,
	-- case_insensitive = false,
}

hop.setup(config)
