-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "prettier",
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
    filetypes = { "typescript", "typescriptreact", "json", "javascript" },
    disabled_filetypes = { "lua", "python" },
    extra_filetypes = { "toml" },
  },
  {
    command = "stylua",
    extra_args = { "--column-width", "90" },
  },
  {
    command = "black",
    filetypes = { "python" },
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
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
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
  -- {
  -- 	command = "proselint",
  -- 	filetypes = { "markdown", "tex" },
  -- 	args = { "--json" },
  -- },
  -- {
  -- 	command = "alex",
  -- 	filetypes = { "markdown" },
  -- 	extra_args = { "--stdin", "--quiet" },
  -- },
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
  -- {
  --   command = "proselint",
  --   filetypes = { "markdown", "tex" },
  --   args = { "--json" },
  -- },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
})
