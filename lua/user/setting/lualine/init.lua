-- require("user.setting.lag")
-- require("user.setting.lualine.evil_lualine")
-- require("user.setting.lualine.bubbles")
-- require("user.setting.lualine.bottom")

-- local conditions = require("lvim.core.lualine.conditions")
-- local colors = require("lvim.core.lualine.colors")
local components = require("lvim.core.lualine.components")

local colors = {
  red = "#ca1243",
  grey = "#a0a1a7",
  black = "#383a42",
  white = "#f3f3f3",
  light_green = "#83a598",
  orange = "#fe8019",
  green = "#8ec07c",
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  -- green = "#98be65",
  -- orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  -- red = "#ec5f67",
}

local branch = {
  "branch",
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
}
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
    inactive = "lualine_d_inactive", -- Color for inactive buffer.
  },
  symbols = {
    modified = " ●", -- Text to show when the buffer is modified
    alternate_file = "", -- Text to show to identify the alternate file
    directory = "", -- Text to show when the buffer is a directory
  },
}

-----------------------------------------------------------------------------

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    -- b = { fg = colors.white, bg = colors.grey },
    -- b = { fg = colors.white, bg = "" },
    -- c = { fg = colors.black, bg = colors.white },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

lvim.builtin.lualine.options = {
  theme = theme,
  -- theme = "auto",
  icons_enabled = lvim.use_icons,
  -- component_separators = { left = "|", right = "|" },
  -- section_separators = { left = "", right = "" },

  component_separators = { left = "", right = "" },
  section_separators = { left = "", right = "" },
  disabled_filetypes = { "alpha", "NvimTree", "Outline" },
}

-- lvim.builtin.lualine.sections.lualine_a = { mode }
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { bufferLine }
-- lvim.builtin.lualine.sections.lualine_b = {}
lvim.builtin.lualine.sections.lualine_c = {}
lvim.builtin.lualine.sections.lualine_x = {}
lvim.builtin.lualine.sections.lualine_y = {
  components.python_env,
  components.diagnostics,
  components.diff,
  branch,
  components.filetype,
}
lvim.builtin.lualine.sections.lualine_z = { "progress" }

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- vim.cmd([[highlight lualine_b_inactive guifg=none ctermbg=none guibg=none]])
    -- vim.cmd([[highlight lualine_c_inactive guifg=none ctermbg=none guibg=none]])
    -- vim.cmd([[highlight lualine_x_inactive guifg=none ctermbg=none guibg=none]])
    -- vim.cmd([[highlight lualine_y_inactive guifg=none ctermbg=none guibg=none]])
    -- vim.cmd([[highlight lualine_d_inactive guifg=none ctermbg=none guibg=none]])

    -- vim.cmd([[highlight lualine_b_normal guifg=none ctermbg=none guibg=none]])
    -- vim.cmd([[highlight lualine_c_normal guifg=none ctermbg=none guibg=none]])
    -- vim.cmd([[highlight lualine_x_normal guifg=none ctermbg=none guibg=none]])
    -- vim.cmd([[highlight lualine_y_normal guifg=none ctermbg=none guibg=none]])
    vim.cmd([[highlight lualine_d_normal guifg=#E06C75 guibg=none]])
  end,
})

lvim.builtin.lualine.options.theme = theme
