-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }
-- lvim.builtin.which_key.vmappings["z"] = {
-- 	"<cmd><C-U>Lspsaga range_code_action<CR>",
-- 	"Diagnostics",
-- }

lvim.builtin.which_key.mappings = {
	["e"] = { "<cmd>lua require'core.nvimtree'.toggle_tree()<CR>", "Explorer" },
	[";"] = { "<cmd>Alpha<CR>", "Dashboard" },
	["w"] = { "<cmd>SaveNFormat<CR>", "Save" },
	["q"] = { "<cmd>lua require('lvim.utils.functions').smart_quit()<CR>", "Quit" },
	["/"] = {
		"<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
		"Comment",
	},
	["c"] = {
		"<cmd>BufferKill<CR>",
		"Close Buffer",
	},
	["f"] = {
		require("lvim.core.telescope.custom-finders").find_project_files,
		"Find File",
	},
	["h"] = {
		"<cmd>nohlsearch<CR>",
		"No Highlight",
	},
	b = {
		name = "Buffers",
		-- c = { "<cmd>BufferKill<CR>", "Close Buffer" },
		p = {
			"<cmd>echo expand('%:p')<cr>",
			"Path",
		},
		j = {
			"<cmd>BufferLinePick<cr>",
			"Jump",
		},
		f = {
			"<cmd>Telescope buffers<cr>",
			"Find",
		},
		b = {
			"<cmd>BufferLineCyclePrev<cr>",
			"Previous",
		},
		-- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
		e = {
			"<cmd>BufferLinePickClose<cr>",
			"Pick which buffer to close",
		},
		h = {
			"<cmd>BufferLineCloseLeft<cr>",
			"Close all to the left",
		},
		l = {
			"<cmd>BufferLineCloseRight<cr>",
			"Close all to the right",
		},
		D = {
			"<cmd>BufferLineSortByDirectory<cr>",
			"Sort by directory",
		},
		L = {
			"<cmd>BufferLineSortByExtension<cr>",
			"Sort by language",
		},
	},
	p = {
		name = "Packer",
		c = {
			"<cmd>PackerCompile<cr>",
			"Compile",
		},
		i = {
			"<cmd>PackerInstall<cr>",
			"Install",
		},
		r = {
			"<cmd>lua require('lvim.plugin-loader').recompile()<cr>",
			"Re-compile",
		},
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = {
			"<cmd>PackerStatus<cr>",
			"Status",
		},
		u = {
			"<cmd>PackerUpdate<cr>",
			"Update",
		},
	},

	-- " Available Debug Adapters:
	-- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
	-- " Adapter configuration and installation instructions:
	-- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
	-- " Debug Adapter protocol:
	-- "   https://microsoft.github.io/debug-adapter-protocol/
	-- " Debugging
	g = {
		name = "Git",
		j = {
			"<cmd>lua require 'gitsigns'.next_hunk()<cr>",
			"Next Hunk",
		},
		k = {
			"<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
			"Prev Hunk",
		},
		l = {
			"<cmd>lua require 'gitsigns'.blame_line()<cr>",
			"Blame",
		},
		p = {
			"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
			"Preview Hunk",
		},
		r = {
			"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
			"Reset Hunk",
		},
		R = {
			"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
			"Reset Buffer",
		},
		s = {
			"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
			"Stage Hunk",
		},
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = {
			"<cmd>Telescope git_status<cr>",
			"Open changed file",
		},
		b = {
			"<cmd>Telescope git_branches<cr>",
			"Checkout branch",
		},
		c = {
			"<cmd>Telescope git_commits<cr>",
			"Checkout commit",
		},
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
	-- t = {
	-- 	name = "+Trouble",
	-- 	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	-- 	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	-- 	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	-- 	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	-- 	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	-- 	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
	-- },
	l = {
		name = "LSP",
		-- d = {
		-- 	"<cmd>Trouble document_diagnostics<cr>",
		-- 	"Diagnostics",
		-- },
		D = {
			"<cmd>Trouble workspace_diagnostics<cr>",
			"Diagnostics All",
		},
		r = {
			"<cmd>Trouble lsp_references<cr>",
			"References",
		},
		-- c = {
		-- 	"<cmd>Lspsaga code_action<CR>",
		-- 	"Code Action",
		-- },
		o = {
			"<cmd>LSoutlineToggle<cr>",
			"Outline",
		},
		f = {
			require("lvim.lsp.utils").format,
			"Format",
		},
		R = {
			"<cmd>Lspsaga rename<CR>",
			"Rename",
		},
		-- j = {
		-- 	"<cmd>Lspsaga diagnostic_jump_next<CR>",
		-- 	"Next Diagnostic",
		-- },
		-- k = {
		-- 	"<cmd>Lspsaga diagnostic_jump_prev<CR>",
		-- 	"Prev Diagnostic",
		-- },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		-- d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
		-- w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = {
			"<cmd>LspInstallInfo<cr>",
			"Installer Info",
		},
		-- j = {
		--   vim.diagnostic.goto_next,
		--   "Next Diagnostic",
		-- },
		-- k = {
		--   vim.diagnostic.goto_prev,
		--   "Prev Diagnostic",
		-- },
		-- l = { vim.lsp.codelens.run, "CodeLens Action" },
		C = {
			name = "Codi",
			c = {
				"<cmd>Codi!!<cr>",
				"Codi Toggle",
			},
			e = {
				"<cmd>CodiExpand<cr>",
				"Expand",
			},
			s = {
				"<cmd>:CodiSelect<cr>",
				"Select",
			},
		},
		p = {
			name = "Peek",
			d = {
				"<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>",
				"Definition",
			},
			t = {
				"<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>",
				"Type Definition",
			},
			i = {
				"<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>",
				"Implementation",
			},
		},
		-- q = { vim.diagnostic.setloclist, "Quickfix" },
		-- r = { vim.lsp.buf.rename, "Rename" },
		-- s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		-- S = {
		--   "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		--   "Workspace Symbols",
		-- },
		-- e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
	},
	L = {
		name = "+LunarVim",
		c = {
			"<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
			"Edit config.lua",
		},
		f = {
			"<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
			"Find LunarVim files",
		},
		g = {
			"<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
			"Grep LunarVim files",
		},
		k = {
			"<cmd>Telescope keymaps<cr>",
			"View LunarVim's keymappings",
		},
		i = {
			"<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
			"Toggle LunarVim Info",
		},
		I = {
			"<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
			"View LunarVim's changelog",
		},
		l = {
			name = "+logs",
			d = {
				"<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
				"view default log",
			},
			D = {
				"<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
				"Open the default logfile",
			},
			l = {
				"<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
				"view lsp log",
			},
			L = {
				"<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>",
				"Open the LSP logfile",
			},
			n = {
				"<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
				"view neovim log",
			},
			N = {
				"<cmd>edit $NVIM_LOG_FILE<cr>",
				"Open the Neovim logfile",
			},
			p = {
				"<cmd>lua require('lvim.core.terminal').toggle_log_view(get_cache_dir() .. '/packer.nvim.log')<cr>",
				"view packer log",
			},
			P = {
				"<cmd>edit $LUNARVIM_CACHE_DIR/packer.nvim.log<cr>",
				"Open the Packer logfile",
			},
		},
		n = {
			"<cmd>Telescope notify<cr>",
			"View Notifications",
		},
		r = {
			"<cmd>LvimReload<cr>",
			"Reload LunarVim's configuration",
		},
		u = {
			"<cmd>LvimUpdate<cr>",
			"Update LunarVim",
		},
	},
	s = {
		name = "Search",
		b = {
			"<cmd>Telescope git_branches<cr>",
			"Checkout branch",
		},
		c = {
			"<cmd>Telescope colorscheme<cr>",
			"Colorscheme",
		},
		f = {
			"<cmd>Telescope find_files<cr>",
			"Find File",
		},
		h = {
			"<cmd>Telescope help_tags<cr>",
			"Find Help",
		},
		H = {
			"<cmd>Telescope highlights<cr>",
			"Find highlight groups",
		},
		M = {
			"<cmd>Telescope man_pages<cr>",
			"Man Pages",
		},
		r = {
			"<cmd>Telescope oldfiles<cr>",
			"Open Recent File",
		},
		R = {
			"<cmd>Telescope registers<cr>",
			"Registers",
		},
		t = {
			"<cmd>Telescope live_grep<cr>",
			"Text",
		},
		k = {
			"<cmd>Telescope keymaps<cr>",
			"Keymaps",
		},
		C = {
			"<cmd>Telescope commands<cr>",
			"Commands",
		},
		-- p = {
		-- 	"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
		-- 	"Colorscheme with Preview",
		-- },
	},
	-- r = {
	-- 	name = "Refactor",
	-- 	e = {
	-- 		"<Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
	-- 		"Extract Function",
	-- 	},
	-- 	f = {
	-- 		"<Cmd>lua require('refactoring').refactor('Extract Function to File')<CR>",
	-- 		"Extract Function to File",
	-- 	},
	-- 	v = {
	-- 		"<Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
	-- 		"Extract Variable",
	-- 	},
	-- 	i = {
	-- 		"<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
	-- 		"Inline Variable",
	-- 	},
	-- 	r = {
	-- 		"<Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	-- 		"Refactor",
	-- 	},
	-- 	V = {
	-- 		"<Cmd>lua require('refactoring').debug.print_var({})<CR>",
	-- 		"Debug Print Var",
	-- 	},
	-- },

	-- T = {
	--   name = "Treesitter",
	--   i = { ":TSConfigInfo<cr>", "Info" },
	-- },
}
