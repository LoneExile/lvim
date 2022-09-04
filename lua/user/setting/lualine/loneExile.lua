local components = require("lvim.core.lualine.components")
local conditions = require("lvim.core.lualine.conditions")
-- local colors = require("lvim.core.lualine.colors")

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

    -- -- add formatter
    -- local formatters = require "lvim.lsp.null-ls.formatters"
    -- local supported_formatters = formatters.list_registered(buf_ft)
    -- vim.list_extend(buf_client_names, supported_formatters)

    -- -- add linter
    -- local linters = require "lvim.lsp.null-ls.linters"
    -- local supported_linters = linters.list_registered(buf_ft)
    -- vim.list_extend(buf_client_names, supported_linters)

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
local bufferLine = {
  "buffers",
  show_filename_only = true, -- Shows shortened relative path when set to false.
  hide_filename_extension = false, -- Hide filename extension when set to true.
  show_modified_status = true, -- Shows indicator when the buffer is modified.

  mode = 0,

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
    a = { fg = colors.black, bg = colors.blue },
    -- b = { fg = colors.white, bg = colors.grey },
    -- b = { fg = colors.white, bg = "" },
    -- c = { fg = colors.black, bg = colors.white },
    z = { fg = colors.black, bg = colors.blue },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.violet } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

lvim.builtin.lualine.options = {
  theme = theme,
  -- theme = "auto",
  icons_enabled = lvim.use_icons,
  -- component_separators = { left = "|", right = "|" },
  -- section_separators = { left = "", right = "" },

  -- component_separators = { left = "", right = "" },
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
  treesitter,
  lsp,
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
    vim.cmd([[highlight lualine_d_normal guifg=#E06C75 guibg=#383a42]])
    vim.cmd([[highlight lualine_d_inactive guifg=#a0a1a7 guibg=#383a42]])
    -- vim.cmd([[highlight lualine_d_inactive guifg=#a0a1a7 guibg=none]])
  end,
})
