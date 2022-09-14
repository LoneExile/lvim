lvim.builtin.bufferline.options.diagnostics_indicator = nil
lvim.builtin.bufferline.options.diagnostics = nil
lvim.builtin.bufferline.options.buffer_close_icon = ""
lvim.builtin.bufferline.options.indicator_icon = nil
lvim.builtin.bufferline.options.indicator = { style = "icon", icon = "▎" }
-- lvim.builtin.bufferline.options.separator_style = "thick"
lvim.builtin.bufferline.highlights = {
  -- gui -> underline = true, undercurl = true, italic = true
  background = {
    -- fg = "#CBA6F7",
    italic = true,
  },
  buffer_selected = {
    fg = "#8A2BE2",
    italic = true,
    bold = true,
  },
  separator = {
    fg = "#CBA6F7",
    -- bg = "#8A2BE2",
  },
} -- Optional

----- BufferLineTogglePin

----- turn off bufferline -----
-- vim.opt.showtabline = 0
-- lvim.builtin.bufferline.active = false
