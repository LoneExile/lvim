-- require("user.setting.lag")
-- require("user.setting.lualine.evil_lualine")
-- require("user.setting.lualine.bubbles")
-- require("user.setting.lualine.bottom")

-- local conditions = require("lvim.core.lualine.conditions")
-- local colors = require("lvim.core.lualine.colors")
local components = require("lvim.core.lualine.components")

local bufferLine = {
  "buffers",
  show_filename_only = true, -- Shows shortened relative path when set to false.
  hide_filename_extension = false, -- Hide filename extension when set to true.
  show_modified_status = true, -- Shows indicator when the buffer is modified.

  mode = 2,

  max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,

  filetype_names = {
    TelescopePrompt = "Telescope",
    daohboard = "Dashboard",
    packer = "Packer",
    fzf = "FZF",
    alpha = "Alpha",
  },

  buffers_color = {
    active = "lualine_d_normal", -- Color for active buffer.
    -- inactive = "lualine_d_inactive", -- Color for inactive buffer.
  },
  symbols = {
    modified = " ●", -- Text to show when the buffer is modified
    alternate_file = "", -- Text to show to identify the alternate file
    directory = "", -- Text to show when the buffer is a directory
  },
}

-----------------------------------------------------------------------------

lvim.builtin.lualine.options = {
  theme = "auto",
  icons_enabled = lvim.use_icons,
  -- component_separators = { left = "|", right = "|" },
  -- section_separators = { left = "", right = "" },

  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
  disabled_filetypes = { "alpha", "NvimTree", "Outline" },
}

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { bufferLine }
lvim.builtin.lualine.sections.lualine_c = {}
lvim.builtin.lualine.sections.lualine_x = {}
lvim.builtin.lualine.sections.lualine_y = {
  components.python_env,
  components.diagnostics,
  components.diff,
  components.branch,
  components.filetype,
}
lvim.builtin.lualine.sections.lualine_z = { "progress" }
