vim.g.copilot_filetypes = { xml = false }
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", "copilot#Accept('<CR>')", { expr = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-.>", "<Plug>(copilot-next)", { noremap = false })
vim.api.nvim_set_keymap("i", "<C-,>", "<Plug>(copilot-previous)", { noremap = false })

vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])

-----------------------

-- local status_cmp, copilotCmp = pcall(require, "copilot-cmp")
-- local status_ok, copilot = pcall(require, "copilot")
-- if not status_ok and status_cmp then
--   -- print("copilot not found")
--   vim.notify("copilot" .. " not found!")
--   return
-- end

-- copilot.setup({
--   panel = {
--     enabled = true,
--   },
--   plugin_manager_path = vim.fn.stdpath("data") .. "/.local/share/lunarvim/site/pack/packer",
-- })

-- require("copilot-cmp").setup({
--   method = "getCompletionsCycling",
--   force_autofmt = false,
--   formatters = {
--     label = require("copilot_cmp.format").format_label_text,
--     insert_text = require("copilot_cmp.format").format_label_text,
--     preview = require("copilot_cmp.format").deindent,
--   },
-- })

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  vim.notify("copilot" .. " not found!")
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
  plugin_manager_path = vim.fn.expand("$HOME") .. "/.local/share/lunarvim/site/pack/packer",
  -- server_opts_overrides = {
  --   trace = "verbose",
  --   settings = {
  --     advanced = {
  --       listCount = 10, -- #completions for panel
  --       inlineSuggestCount = 3, -- #completions for getCompletions
  --     },
  --   },
  -- },
}

copilot.setup(config)
