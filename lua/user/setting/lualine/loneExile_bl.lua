local components = require("lvim.core.lualine.components")
local conditions = require("lvim.core.lualine.conditions")

lvim.builtin.lualine.sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

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
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
}

local branch = {
  "branch",
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
}

local lsp = {
  function(msg)
    msg = msg or "LS Inactive"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      -- TODO: clean up this if statement
      if type(msg) == "boolean" or #msg == 0 then
        return "LS Inactive"
      end
      return msg
    end
    local buf_ft = vim.bo.filetype
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        table.insert(buf_client_names, client.name)
      end
    end

    local unique_client_names = vim.fn.uniq(buf_client_names)
    return "[" .. table.concat(unique_client_names, ", ") .. "]"
  end,
  color = { fg = colors.yellow, gui = "bold" },
  cond = conditions.hide_in_width,
}
local treesitter = {
  function()
    return ""
  end,
  color = function()
    local buf = vim.api.nvim_get_current_buf()
    local ts = vim.treesitter.highlighter.active[buf]
    return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
  end,
  cond = conditions.hide_in_width,
}
-----------------------------------------------------------------------------

local theme = {
  normal = {
    a = { fg = colors.white, bg = "#265270" },
    b = { bg = nil },
    c = { bg = nil },
    x = { bg = nil },
    y = { bg = nil },
    z = { fg = colors.white, bg = "#265270" },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.violet } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

lvim.builtin.lualine.options = {
  theme = theme,
  -- theme = "auto",
  icons_enabled = lvim.use_icons,
  section_separators = { left = "", right = "" },
  disabled_filetypes = { "alpha", "NvimTree", "Outline" },
}

lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = {}
lvim.builtin.lualine.sections.lualine_c = {}
lvim.builtin.lualine.sections.lualine_x = {}
lvim.builtin.lualine.sections.lualine_y = {
  treesitter,
  lsp,
  components.python_env,
  components.diagnostics,
  components.diff,
  branch,
  components.filetype,
}
lvim.builtin.lualine.sections.lualine_z = { "progress" }
