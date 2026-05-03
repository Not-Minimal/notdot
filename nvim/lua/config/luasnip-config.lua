-- LuaSnip Configuration
-- Snippet engine for Neovim with support for custom and friendly-snippets

local luasnip = require("luasnip")
local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt

-- Setup LuaSnip
luasnip.setup({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[require("luasnip.util.types").choiceNode] = {
			active = {
				virt_text = { { " ◀", "NonText" } },
			},
		},
	},
})

-- Keybindings for snippet navigation
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<C-l>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)

vim.keymap.set("i", "<C-h>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(-1)
	end
end)

-- Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Custom snippets for common patterns
local js_tsx_snippets = {
	-- React functional component
	s("rfc", fmt("export default function {name}() {{\n  return (\n    <div>\n      {content}\n    </div>\n  );\n}}\n", {
		name = i(1, "ComponentName"),
		content = i(2, ""),
	})),

	-- useState hook
	s("use", fmt("const [{state}, set{State}] = useState({initial});", {
		state = i(1, "state"),
		State = d(2, function(args)
			return sn(nil, t(args[1][1]:gsub("^%l", string.upper)))
		end, { 1 }),
		initial = i(3, "null"),
	})),

	-- useEffect hook
	s("uef", fmt("useEffect(() => {{\n  {content}\n}}, [{deps}]);", {
		content = i(1, ""),
		deps = i(2, ""),
	})),

	-- Async function
	s("asf", fmt("async function {name}({args}) {{\n  {content}\n}}", {
		name = i(1, "functionName"),
		args = i(2, ""),
		content = i(3, ""),
	})),

	-- Arrow function
	s("af", fmt("({args}) => {{\n  {content}\n}}", {
		args = i(1, ""),
		content = i(2, ""),
	})),
}

-- Python snippets
local python_snippets = {
	-- Function definition
	s("def", fmt("def {name}({args}):\n    {content}\n    return None", {
		name = i(1, "function_name"),
		args = i(2, ""),
		content = i(3, "pass"),
	})),

	-- Class definition
	s("cls", fmt("class {name}:\n    def __init__(self, {args}):\n        {content}\n", {
		name = i(1, "ClassName"),
		args = i(2, ""),
		content = i(3, "pass"),
	})),

	-- For loop
	s("for", fmt("for {var} in {iter}:\n    {content}", {
		var = i(1, "item"),
		iter = i(2, "iterable"),
		content = i(3, "pass"),
	})),

	-- If statement
	s("if", fmt("if {condition}:\n    {content}", {
		condition = i(1, "condition"),
		content = i(2, "pass"),
	})),

	-- Try except
	s("try", fmt("try:\n    {try_content}\nexcept {exception} as {var}:\n    {except_content}", {
		try_content = i(1, "pass"),
		exception = i(2, "Exception"),
		var = i(3, "e"),
		except_content = i(4, "pass"),
	})),
}

-- Lua snippets
local lua_snippets = {
	-- Function
	s("fn", fmt("function {name}({args})\n    {content}\nend", {
		name = i(1, "function_name"),
		args = i(2, ""),
		content = i(3, ""),
	})),

	-- Local function
	s("lfn", fmt("local function {name}({args})\n    {content}\nend", {
		name = i(1, "function_name"),
		args = i(2, ""),
		content = i(3, ""),
	})),

	-- Table
	s("tbl", fmt("local {name} = {{\n    {content}\n}}", {
		name = i(1, "table_name"),
		content = i(2, ""),
	})),
}

-- Load custom snippets for each language
luasnip.add_snippets("javascript", js_tsx_snippets, { key = "js" })
luasnip.add_snippets("typescript", js_tsx_snippets, { key = "js" })
luasnip.add_snippets("typescriptreact", js_tsx_snippets, { key = "js" })
luasnip.add_snippets("javascriptreact", js_tsx_snippets, { key = "js" })
luasnip.add_snippets("python", python_snippets, { key = "python" })
luasnip.add_snippets("lua", lua_snippets, { key = "lua" })

return luasnip
