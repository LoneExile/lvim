local opts = { noremap = true, silent = true }

vim.keymap.set("n", "tn", "<cmd>tabnew<CR>", opts)
vim.keymap.set("n", "tt", "<cmd>ToggleTerm<CR>", opts)
vim.keymap.set("n", "tl", "<cmd>tabNext<CR>", opts)
vim.keymap.set("n", "th", "<cmd>tabprevious<CR>", opts)
vim.keymap.set("n", "tc", "<cmd>tabclose<CR>", opts)
