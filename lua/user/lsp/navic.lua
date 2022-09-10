local navic = require("nvim-navic")
local lspconfig = require("lspconfig")

lspconfig.sumneko_lua.setup({
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
})
lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
})

-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   navic.attach(client, bufnr)
-- end
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

---------------------------------------------------------
navic.setup({
  icons = {
    File = " ",
    Module = " ",
    Namespace = " ",
    Package = " ",
    Class = " ",
    Method = " ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = "練",
    Interface = "練",
    Function = " ",
    Variable = " ",
    Constant = " ",
    String = " ",
    Number = " ",
    Boolean = "◩ ",
    Array = " ",
    Object = " ",
    Key = " ",
    Null = "ﳠ ",
    EnumMember = " ",
    Struct = " ",
    Event = " ",
    Operator = " ",
    TypeParameter = " ",
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
})
