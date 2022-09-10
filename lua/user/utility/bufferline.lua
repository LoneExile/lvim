lvim.builtin.bufferline.options.diagnostics_indicator = nil
lvim.builtin.bufferline.options.diagnostics = nil
lvim.builtin.bufferline.options.buffer_close_icon = ""
lvim.builtin.bufferline.options.indicator_icon = "▎" --"" ---"▎"
-- lvim.builtin.bufferline.options.separator_style = "thick"
lvim.builtin.bufferline.highlights = {
  background = {
    -- guifg = "#CBA6F7",
    gui = "italic",
  },
  buffer_selected = {
    guifg = "#8A2BE2",
    gui = "bold,italic",
  },
  separator = {
    guifg = "#CBA6F7",
    -- guibg = "#8A2BE2",
  },
} -- Optional

----- BufferLineTogglePin

----- turn off bufferline -----
-- vim.opt.showtabline = 0
-- lvim.builtin.bufferline.active = false
