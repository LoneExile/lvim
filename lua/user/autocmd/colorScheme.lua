-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local hl_groups = {
      "WhichKeyFloat",
      "FloatBorder",
      "NormalFloat",
      "VertSplit",
      "WinBar",
      "StatusLine",
      "StatusLineNC",
      "WinBarNC",
    }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
      vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
      vim.cmd([[highlight CodiVirtualText guifg=cyan]])
      vim.cmd([[highlight IndentBlanklineContextChar guifg=#61AFEF gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineSpaceChar guifg=#5c6370 gui=nocombine]])
      -- vim.cmd([[highlight IndentBlanklineContextStart guifg=#C678DD gui=underline]])

      -- vim.cmd([[highlight TSComment guifg=#5c6370 ctermfg=14 gui=italic ]])
      -- vim.cmd([[highlight TSFunction guifg=#61afef gui=italic ]])
    end
  end,
})
