-- LazyDev Configuration
-- Makes lua_ls aware of the Neovim API and installed plugins when editing Lua config

require("lazydev").setup({
	library = {
		-- Load luvit types when the `vim.uv` word is found
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})
