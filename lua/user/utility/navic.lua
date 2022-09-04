local status_ok_code, navic = pcall(require, "nvim-navic")
if not status_ok_code then
  vim.notify("navic" .. " not found!")
  return
end

require("lspconfig").clangd.setup({
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
})
