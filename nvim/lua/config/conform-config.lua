require("conform").setup({
	format_on_save = {
		timeout_ms = 2000, -- Aumentamos el timeout para evitar errores
		lsp_format = "fallback", -- Nueva sintaxis recomendada en lugar de lsp_fallback
	},
	formatters_by_ft = {
		-- Formateadores universales (se aplican a TODOS los archivos)
		-- 'trim_whitespace' elimina espacios al final de la línea (limpia las líneas que solo tienen espacios)
		-- 'trim_newlines' elimina los saltos de línea vacíos extra al final del archivo
		["*"] = { "trim_whitespace", "trim_newlines" },

		-- Biome solo soporta JS/TS/JSON/CSS
		javascript = { "biome" },
		typescript = { "biome" },
		javascriptreact = { "biome" },
		typescriptreact = { "biome" },
		json = { "biome" },
		jsonc = { "biome" },
		css = { "biome" },

		-- Para otros lenguajes usamos formateadores específicos o el LSP (fallback)
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
	},
})

-- Format keybinding
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
		timeout_ms = 2000,
	})
end, { desc = "Format file/range" })