local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

local configs = {
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,
  },
}

harpoon.setup(configs)

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)
vim.keymap.set("n", "<C-2>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)
vim.keymap.set("n", "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)
vim.keymap.set("n", "<C-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)
vim.keymap.set("n", "<C-5>", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", opts)
