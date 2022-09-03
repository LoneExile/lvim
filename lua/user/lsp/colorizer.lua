local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	vim.notify("colorizer" .. " not found!")
	return
end

local config = {
	-- "css",
	-- "javascript",
	-- html = {
	-- 	mode = "foreground",
	-- },
	-- "*", -- Highlight all files, but customize some others.
	-- "!vim", -- Exclude vim from highlighting.
	-- -- Exclusion Only makes sense if '*' is specified!
}

colorizer.setup(config)
