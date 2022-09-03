-- require("spectre").setup()

local status_ok_code, spectre = pcall(require, "spectre")
if not status_ok_code then
	vim.notify("spectre" .. " not found!")
	return
end

-- local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "S", "<cmd>lua require('spectre').open_file_search()<CR>", opts)

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "s", "<cmd>lua require('spectre').open_file_search()<CR>", opts)
vim.keymap.set("n", "S", "<cmd>lua require('spectre').open()<CR>", opts)

local config = {
	color_devicons = true,
	-- open_cmd = "vnew",
	live_update = false, -- auto execute search again when you write any file in vim
	default = {
		find = {
			--pick one of item in find_engine
			cmd = "rg",
			options = { "ignore-case" },
		},
		replace = {
			--pick one of item in replace_engine
			cmd = "oxi",
		},
	},
	-- line_sep_start = "┌-----------------------------------------",
	-- result_padding = "¦  ",
	-- line_sep = "└-----------------------------------------",
	-- highlight = {
	-- 	ui = "String",
	-- 	search = "DiffChange",
	-- 	replace = "DiffDelete",
	-- },
	-- replace_vim_cmd = "cdo",
	-- is_open_target_win = true, --open file on opener window
	-- is_insert_mode = false, -- start open panel on is_insert_mode
}

spectre.setup(config)