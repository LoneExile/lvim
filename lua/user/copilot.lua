-- vim.g.copilot_filetypes = { xml = false }
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap(
-- 	"i",
-- 	"<C-a>",
-- 	"copilot#Accept('<CR>')",
-- 	{ expr = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
-- 	"i",
-- 	"<C-.>",
-- 	"copilot-next('<CR>')",
-- 	{ expr = true, silent = true }
-- )

-- vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])

-----------------------

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end

local config = {
	cmp = {
		enabled = true,
		method = "getCompletionsCycling",
	},
	panel = { -- no config options yet
		enabled = true,
	},
	-- ft_disable = { "markdown" },
	plugin_manager_path = vim.fn.expand("$HOME")
		.. "/.local/share/lunarvim/site/pack/packer",
}

-- local config2 = {
-- 	cmp = {
-- 		enabled = true,
-- 		method = "getCompletionsCycling",
-- 	},
-- 	panel = { -- no config options yet
-- 		enabled = true,
-- 	},
-- 	ft_disable = { "markdown" },
-- 	-- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
-- 	server_opts_overrides = {
-- 		-- trace = "verbose",
-- 		settings = {
-- 			advanced = {
-- 				-- listCount = 10, -- #completions for panel
-- 				inlineSuggestCount = 3, -- #completions for getCompletions
-- 			},
-- 		},
-- 	},
-- }

copilot.setup(config)
