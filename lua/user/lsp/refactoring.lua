-- local status_ok, refactoring = pcall(require, "refactoring")
-- if not status_ok then
-- 	vim.notify("refactoring" .. " not found!")
-- 	return
-- end

-- local config = {
-- 	-- prompt for return type
-- 	prompt_func_return_type = {
-- 		go = true,
-- 		cpp = true,
-- 		c = true,
-- 		java = true,
-- 	},
-- 	-- prompt for function parameters
-- 	prompt_func_param_type = {
-- 		go = true,
-- 		cpp = true,
-- 		c = true,
-- 		java = true,
-- 	},
-- }

-- refactoring.setup(config)

require("telescope").load_extension("refactoring")
