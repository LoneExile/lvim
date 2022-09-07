vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  pattern = { "*" },
  command = ":ColorizerAttachToBuffer",
})
