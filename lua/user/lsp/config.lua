-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "zk", "remark-language-server" })
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("marksman", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-------------------------------------------------------------------------------------
-- lvim.lsp.automatic_configuration.skipped_filetypes = { "rst", "plaintext" }

-- lvim.builtin.mason.ui = {
--   border = {
--     relative = "editor",
--     border = "rounded",
--     width = 30,
--     height = 40,
--     row = 1,
--     -- col = 1,
--     -- col = 80,
--     col = 160,
--   },
--   keymaps = {
--     toggle_package_expand = "<CR>",
--     install_package = "i",
--     update_package = "u",
--     check_package_version = "c",
--     update_all_packages = "U",
--     check_outdated_packages = "C",
--     uninstall_package = "X",
--     cancel_installation = "<C-c>",
--     apply_language_filter = "<C-f>",
--   },
-- }

-------------------------------------------------------------
