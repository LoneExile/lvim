local screen_w = vim.opt.columns:get()
local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
local _width = screen_w
local _height = screen_h
local width = math.floor(_width)
local height = math.floor(_height)
local center_y = (vim.opt.lines:get() - _height) / 2
local center_x = (screen_w - _width) / 2

lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.nvimtree.setup.view = {
  width = 30,
  height = 30,
  hide_root_folder = true,
  side = "right",
  preserve_window_proportions = false,
  mappings = {
    custom_only = false,
    list = {},
  },
  number = false,
  relativenumber = false,
  signcolumn = "yes",
  float = {
    enable = true,
    open_win_config = {
      relative = "editor",
      border = "rounded",
      width = 30,
      height = 30,
      row = 1,
      col = 160,
      -- col = 1,
    },
  },
}
