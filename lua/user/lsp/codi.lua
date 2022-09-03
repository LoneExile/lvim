-- local status_ok, codi = pcall(require, "codi")
-- if not status_ok then
-- 	vim.notify("codi" .. " not found!")
-- 	return
-- end

-- local configs = {}
-- codi.setup(configs)
-------------------------------------------------------

vim.cmd("source ~/.config/lvim/lua/user/lsp/codi.vim")

-- vim.g["codi#virtual_text_prefix"] = "❯❯❯ "
-- vim.g["codi#rightsplit"] = 0
-- vim.g["codi#rightalign"] = 0
-- vim.g["codi#virtual_text_pos"] = 50
-- vim.g["codi#virtual_text"] = "0"
