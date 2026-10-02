-- Detect formatter locations
local function detect_formatter(name)
	local cmd = "which " .. name .. " 2>/dev/null"
	local handle = io.popen(cmd)
	if handle then
		local result = handle:read("*a"):gsub("\n", "")
		handle:close()
		if result ~= "" then
			return result
		end
	end

	-- Fallback for pipx-installed tools
	local home = os.getenv("HOME") or ""
	local pipx_path = home .. "/.local/bin/" .. name
	local f = io.open(pipx_path)
	if f then
		f:close()
		return pipx_path
	end

	return name
end

local conform = require("conform")

-- Get paths to formatters
local biome_path = detect_formatter("biome")
local stylua_path = detect_formatter("stylua")
local black_path = detect_formatter("black")
local isort_path = detect_formatter("isort")
local prettier_path = detect_formatter("prettier")
local rustfmt_path = detect_formatter("rustfmt")

conform.setup({
	format_on_save = function(bufnr)
		-- Disable autoformat for certain filetypes
		local ignore_filetypes = { "sql", "java" }
		if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
			return
		end

		return {
			timeout_ms = 5000,
			lsp_format = "fallback",
		}
	end,
	formatters_by_ft = {
		-- Formateadores universales (se aplican a TODOS los archivos)
		["*"] = { "trim_whitespace", "trim_newlines" },

		-- Biome para JS/TS/JSON/CSS
		javascript = { "biome" },
		typescript = { "biome" },
		javascriptreact = { "biome" },
		typescriptreact = { "biome" },
		json = { "biome" },
		jsonc = { "biome" },
		css = { "biome" },

		-- Lenguajes específicos
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
		html = { "prettier" },
		markdown = { "prettier" },
		dockerfile = {}, -- Uses LSP fallback via vim.lsp
	},
	log_level = vim.log.levels.WARN,
	notify_on_error = true,
	formatters = {
		biome = {
			command = biome_path,
			args = { "format", "--write", "$FILENAME" },
			stdin = false,
		},
		stylua = {
			command = stylua_path,
		},
		black = {
			command = black_path,
			args = { "--quiet", "-" },
			stdin = true,
		},
		isort = {
			command = isort_path,
			args = { "$FILENAME" },
			stdin = false,
		},
		prettier = {
			command = prettier_path,
			args = { "--write", "$FILENAME" },
			stdin = false,
		},
		rustfmt = {
			command = rustfmt_path,
		},
	},
})

-- Enable format-on-save auto command
local group = vim.api.nvim_create_augroup("conform_format", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	callback = function(args)
		local bufnr = args.buf
		pcall(function()
			require("conform").format({
				bufnr = bufnr,
				async = false,
				timeout_ms = 5000,
				lsp_format = "fallback",
			})
		end)
	end,
})

-- Format keybinding - with better error handling
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	pcall(function()
		local result = require("conform").format({
			async = false,
			lsp_format = "fallback",
			timeout_ms = 5000,
		})
		if result then
			vim.notify("✓ Formatted!", vim.log.levels.INFO)
		else
			vim.notify("✗ No formatter found", vim.log.levels.WARN)
		end
	end)
end, { desc = "Format file/range" })