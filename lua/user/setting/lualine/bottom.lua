local lualine = require("lualine")
lvim.builtin.lualine.sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}
lvim.builtin.lualine.inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}
local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local configs = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
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
          -- active = "lualine_d_normal", -- Color for active buffer.
          inactive = "lualine_d_inactive", -- Color for inactive buffer.
        },
        symbols = {
          modified = " ●", -- Text to show when the buffer is modified
          alternate_file = "", -- Text to show to identify the alternate file
          directory = "", -- Text to show when the buffer is a directory
        },
      },
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  -- table.insert(config.sections.lualine_c, component)
  table.insert(lvim.builtin.lualine.sections.lualine_c, component)
end

-- ins_left({
--   function()
--     return "▊"
--   end,
--   color = { fg = colors.blue }, -- Sets highlighting of component
--   padding = { left = 0, right = 1 }, -- We don't need space before this
-- })

ins_left({
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
    -- active = "lualine_d_normal", -- Color for active buffer.
    inactive = "lualine_d_inactive", -- Color for inactive buffer.
  },
  symbols = {
    modified = " ●", -- Text to show when the buffer is modified
    alternate_file = "", -- Text to show to identify the alternate file
    directory = "", -- Text to show when the buffer is a directory
  },
})

require("lualine").setup(configs)
