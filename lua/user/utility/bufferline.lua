local function diagnostics_indicator(num, _, diagnostics, _)
	local result = {}
	local symbols = { error = " ", warning = " ", info = "" }
	if not lvim.use_icons then
		return "(" .. num .. ")"
	end
	for name, count in pairs(diagnostics) do
		if symbols[name] and count > 0 then
			table.insert(result, symbols[name] .. " " .. count)
		end
	end
	result = table.concat(result, " ")
	return #result > 0 and result or ""
end

-- lvim.builtin.bufferline.options.diagnostics_indicator = diagnostics_indicator
lvim.builtin.bufferline.options.diagnostics_indicator = ""
lvim.builtin.bufferline.options.diagnostics = ""
