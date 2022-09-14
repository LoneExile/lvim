require("user.lsp.config")
require("user.lsp.lspsaga")
require("user.lsp.null-ls")
require("user.lsp.colorizer")
require("user.lsp.codi")
require("user.lsp.cmp")
require("user.lsp.refactoring")
require("user.lsp.sniprun")
-- require("user.lsp.trouble") -- not working

require("lspconfig.ui.windows").default_options.border = "single" -- border lsp info

vim.g.python3_host_prog = "$HOME/.pyenv/versions/nvim/bin/python3"
-- vim.g.python3_host_prog = "/home/bunlaikun/.pyenv/shims/python"

lvim.lsp.buffer_mappings = {
  normal_mode = {
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Show hover" },
    ["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "Goto Definition" },
    ["gs"] = { vim.lsp.buf.signature_help, "show signature help" },
    ["gr"] = { "<cmd>Lspsaga lsp_finder<CR>", "Goto references" },
    ["gR"] = { "<cmd>Lspsaga rename<CR>", "rename" },
    ["gq"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
    ["gj"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic" },
    ["gk"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev diagnostic" },
    ["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
    ["gI"] = { vim.lsp.buf.implementation, "Goto Implementation" },
    ["gp"] = {
      function()
        require("lvim.lsp.peek").Peek("definition")
      end,
      "Peek definition",
    },
    ["gl"] = {
      "<cmd>Lspsaga show_line_diagnostics<cr>",
      -- function()
      --   local config = lvim.lsp.diagnostics.float
      --   config.scope = "line"
      --   vim.diagnostic.open_float(0, config)
      -- end,
      "Show line diagnostics",
    },
  },
  insert_mode = {},
  visual_mode = {
    ["gq"] = { "<Esc><cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
  },
}
