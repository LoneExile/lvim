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
      height = 40,
      row = 1,
      col = 160,
      -- col = 1,
    },
  },
}
local function telescope_find_files(_)
  require("lvim.core.nvimtree").start_telescope("find_files")
end

local function telescope_live_grep(_)
  require("lvim.core.nvimtree").start_telescope("live_grep")
end

if #lvim.builtin.nvimtree.setup.view.mappings.list == 0 then
  lvim.builtin.nvimtree.setup.view.mappings.list = {
    { key = { "h", "<CR>", "o" }, action = "edit", mode = "n" },
    { key = "l", action = "close_node" },
    { key = "<Esc>", action = "NvimTreeClose" },
    { key = "v", action = "vsplit" },
    { key = "C", action = "cd" },
    { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
    { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
  }
end
