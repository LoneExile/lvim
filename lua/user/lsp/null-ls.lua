-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		-- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		extra_args = {
			"--no-semi",
			"--single-quote",
			"--jsx-single-quote",
			"--print-width",
			"80",
			"--use-tabs",
			"--no-bracket-spacing",
			-- "--config",
			-- "./Path"
		},
		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		-- filetypes = { "typescript", "typescriptreact", "json" },
		disabled_filetypes = { "lua", "python" },
		extra_filetypes = { "toml" },
	},
	{
		command = "stylua",
		extra_args = { "--column-width", "90" },
	},
	{
		command = "black",
		extra_args = { "--fast", "--line-length", "90" },
	},
	-- {
	-- 	command = "",
	-- },
	-- {
	-- 	command = "isort",
	-- 	filetypes = { "python" },
	-- 	extra_args = { "--line-length", "30" },
	-- },
	{
		command = "beautysh",
		filetypes = { "bash", "csh", "ksh", "sh", "zsh" },
		extra_args = { "$FILENAME" },
	},
})

-- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "flake8",
		filetypes = { "python" },
		extra_args = { "--max-line-length", "90" },
	},
	{
		-- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "shellcheck",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		extra_args = { "--severity", "warning" },
	},
	{
		command = "codespell",
		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		-- filetypes = { "javascript", "python", "typescript", "typescriptreact" },
	},
	{
		command = "eslint",
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
		},
		extra_args = {
			-- "-f",
			-- "json",
			-- "--stdin",
			-- "--stdin-filename",
			-- "$FILENAME",
			"--no-eslintrc",
			"--env",
			"es6",
		},
	},
	{
		command = "proselint",
		filetypes = { "markdown", "tex" },
		args = { "--json" },
	},
	{
		command = "alex",
		filetypes = { "markdown" },
		extra_args = { "--stdin", "--quiet" },
	},
	-- {
	-- 	command = "hadolint",
	-- 	filetype = { "dockerfile" },
	-- 	extra_args = { "--no-fail", "--format=json", "-" },
	-- },
	{
		command = "zsh",
		filetypes = { "zsh" },
		extra_args = { "-n", "$FILENAME" },
	},
	{
		command = "actionlint",
		filetype = { "yaml" },
		extra_args = { "-no-color", "-format", "{{json .}}", "-" },
	},
})

-- set additional codeaction
local codeaction = require("lvim.lsp.null-ls.code_actions")
codeaction.setup({
	{
		command = "refactoring",
		filetype = { "go", "javascript", "lua", "python", "typescript" },
	},
	{
		command = "eslint",
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
		},
		extra_args = {
			-- "-f",
			-- "json",
			-- "--stdin",
			-- "--stdin-filename",
			-- "$FILENAME",
			"--no-eslintrc",
			"--env",
			"es6",
		},
	},
	{
		command = "proselint",
		filetypes = { "markdown", "tex" },
		args = { "--json" },
	},
	{
		-- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
		command = "shellcheck",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		extra_args = { "--severity", "warning" },
	},
})
