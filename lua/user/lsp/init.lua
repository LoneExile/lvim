-- require("user.lsp.config")
require("user.lsp.lspsaga")
require("user.lsp.null-ls")
require("user.lsp.colorizer")
require("user.lsp.ts-autotag")
require("user.lsp.codi")
require("user.lsp.cmp")
require("user.lsp.refactoring")
-- require("user.lsp.trouble") -- not working

lvim.lsp.buffer_mappings = {
	normal_mode = {
		-- ["K"] = { vim.lsp.buf.hover, "Show hover" },
		-- ["gd"] = { vim.lsp.buf.definition, "Goto Definition" },
		["gs"] = { vim.lsp.buf.signature_help, "show signature help" },
		-- ["gr"] = { vim.lsp.buf.references, "Goto references" },
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Show hover" },
		["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
		["gI"] = { vim.lsp.buf.implementation, "Goto Implementation" },
		["gp"] = {
			function()
				require("lvim.lsp.peek").Peek("definition")
			end,
			"Peek definition",
		},
		["gl"] = {
			function()
				local config = lvim.lsp.diagnostics.float
				config.scope = "line"
				vim.diagnostic.open_float(0, config)
			end,
			"Show line diagnostics",
		},
	},
	insert_mode = {},
	visual_mode = {},
}
