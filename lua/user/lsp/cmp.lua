lvim.builtin.cmp.formatting.kind_icons = {
  Copilot = " ",
  Class = " ",
  Color = " ",
  Constant = "ﲀ ",
  Constructor = " ",
  Enum = "練",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = "",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Operator = "",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = "塞",
  Value = " ",
  Variable = " ",
}
lvim.builtin.cmp.formatting.source_names = {
  copilot = "(Copilot)",
  nvim_lsp = "(LSP)",
  emoji = "(Emoji)",
  path = "(Path)",
  calc = "(Calc)",
  cmp_tabnine = "(Tabnine)",
  vsnip = "(Snippet)",
  luasnip = "(Snippet)",
  buffer = "(Buffer)",
  tmux = "(TMUX)",
}
lvim.builtin.cmp.sources = {
  { name = "copilot" },
  { name = "nvim_lsp" },
  { name = "path" },
  { name = "luasnip" },
  { name = "cmp_tabnine" },
  { name = "nvim_lua" },
  { name = "buffer" },
  { name = "calc" },
  { name = "emoji" },
  { name = "treesitter" },
  { name = "crates" },
  { name = "tmux" },
}

-- table.insert(lvim.builtin.cmp.formatting.kind_icons, 'Copilot = " "')
-- table.insert(lvim.builtin.cmp.formatting.source_names, 'copilot = "(Copilot)"')
-- table.insert(lvim.builtin.cmp.sources, { name = "copilot", group_index = 2 })

lvim.builtin.cmp.formatting.format = function(entry, vim_item)
  local max_width = lvim.builtin.cmp.formatting.max_width
  if max_width ~= 0 and #vim_item.abbr > max_width then
    vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
  end
  if lvim.use_icons then
    vim_item.kind = lvim.builtin.cmp.formatting.kind_icons[vim_item.kind]
  end
  if entry.source.name == "copilot" then
    vim_item.kind = " "
    vim_item.kind_hl_group = "CmpItemKindCopilot"
  end
  vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]
  vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
    or lvim.builtin.cmp.formatting.duplicates_default
  return vim_item
end

------------------------ require ------------------------------
---------------------------------------------------------------

local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  print("cmp")
  return
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
  print(luasnip)
  return
end

------------------------ function------------------------------
---------------------------------------------------------------
local function jumpable(dir)
  local luasnip_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_ok then
    return false
  end

  local win_get_cursor = vim.api.nvim_win_get_cursor
  local get_current_buf = vim.api.nvim_get_current_buf

  ---sets the current buffer's luasnip to the one nearest the cursor
  ---@return boolean true if a node is found, false otherwise
  local function seek_luasnip_cursor_node()
    -- TODO(kylo252): upstream this
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snippet = node.parent.snippet
    local exit_node = snippet.insert_nodes[0]

    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1

    -- exit early if we're past the exit node
    if exit_node then
      local exit_pos_end = exit_node.mark:pos_end()
      if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    node = snippet.inner_first:jump_into(1, true)
    while node ~= nil and node.next ~= nil and node ~= snippet do
      local n_next = node.next
      local next_pos = n_next and n_next.mark:pos_begin()
      local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
        or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

      -- Past unmarked exit node, exit early
      if n_next == nil or n_next == snippet.next then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end

      if candidate then
        luasnip.session.current_nodes[get_current_buf()] = node
        return true
      end

      local ok
      ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
      if not ok then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    -- No candidate, but have an exit node
    if exit_node then
      -- to jump to the exit node, seek to snippet
      luasnip.session.current_nodes[get_current_buf()] = snippet
      return true
    end

    -- No exit node, exit from snippet
    snippet:remove_from_jumplist()
    luasnip.session.current_nodes[get_current_buf()] = nil
    return false
  end

  if dir == -1 then
    return luasnip.in_snippet() and luasnip.jumpable(-1)
  else
    return luasnip.in_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable(1)
  end
end

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

------------------------ Mapping ------------------------------
---------------------------------------------------------------

lvim.builtin.cmp.mapping = cmp.mapping.preset.insert({
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<C-j>"] = cmp.mapping.select_next_item(),
  ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
  ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-y>"] = cmp.mapping({
    i = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    c = function(fallback)
      if cmp.visible() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
      else
        fallback()
      end
    end,
  }),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() and has_words_before() then
      -- if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_locally_jumpable() then
      luasnip.expand_or_jump()
    elseif jumpable(1) then
      luasnip.jump(1)
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  -- ["<CR>"] = cmp.mapping.confirm({
  -- 	behavior = cmp.ConfirmBehavior.Replace,
  -- 	select = true,
  -- }),
  ["<CR>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      local confirm_opts = lvim.builtin.cmp.confirm_opts
      local is_insert_mode = function()
        return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
      end
      if is_insert_mode() then -- prevent overwriting brackets
        confirm_opts.behavior = cmp.ConfirmBehavior.Insert
        -- -- confirm_opts.behavior = cmp.ConfirmBehavior.Replace
        -- confirm_opts.select = true
      end
      cmp.confirm(confirm_opts)
      if jumpable(1) then
        luasnip.jump(1)
      end
      return
    end

    if jumpable(1) then
      if not luasnip.jump(1) then
        fallback()
      end
    else
      fallback()
    end
  end),
})
