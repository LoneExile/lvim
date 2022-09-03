-- local dap, dapui = require("dap"), require("dapui")
lvim.builtin.dap.active = true

-- local status_ok, dap = pcall(require, "dap")
-- if not status_ok then
-- 	vim.notify("dap" .. " not found!")
-- 	return
-- end

-- -- C++ --

-- lvim.builtin.dap.on_config_done = function()
-- 	dap.adapters.lldb = {
-- 		type = "executable",
-- 		command = "/usr/bin/lldb-vscode",
-- 		name = "lldb",
-- 	}

-- 	dap.configurations.cpp = {
-- 		{
-- 			name = "Launch",
-- 			type = "lldb",
-- 			request = "launch",
-- 			program = "${workspaceFolder}/build/binary_name",
-- 			cwd = "${workspaceFolder}/build",
-- 			stopOnEntry = false,
-- 			args = {},
-- 			runInTerminal = false,
-- 		},
-- 	}
-- 	dap.configurations.c = dap.configurations.cpp
-- end
