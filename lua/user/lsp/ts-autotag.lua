-- require('nvim-ts-autotag').setup()

local status_ok, treesitterConfigs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("nvim-treesitter.configs" .. " not found!")
	return
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		-- virtual_text = {
		-- 	spacing = 5,
		-- 	severity_limit = "Warning",
		-- },
		update_in_insert = true,
	})

local configs = {
	-- autotag = {
	-- 	enable = true,
	-- },
	-- filetypes = {
	-- 	"html",
	-- 	"javascript",
	-- 	"typescript",
	-- 	"javascriptreact",
	-- 	"typescriptreact",
	-- 	"svelte",
	-- 	"vue",
	-- 	"tsx",
	-- 	"jsx",
	-- 	"rescript",
	-- 	"xml",
	-- 	"php",
	-- 	"markdown",
	-- 	"glimmer",
	-- 	"handlebars",
	-- 	"hbs",
	-- },
	-- skip_tags = {
	-- 	"area",
	-- 	"base",
	-- 	"br",
	-- 	"col",
	-- 	"command",
	-- 	"embed",
	-- 	"hr",
	-- 	"img",
	-- 	"slot",
	-- 	"input",
	-- 	"keygen",
	-- 	"link",
	-- 	"meta",
	-- 	"param",
	-- 	"source",
	-- 	"track",
	-- 	"wbr",
	-- 	"menuitem",
	-- },
}

treesitterConfigs.setup(configs)
