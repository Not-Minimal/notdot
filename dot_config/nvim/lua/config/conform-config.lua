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
local stylua_path = detect_formatter("stylua")
local black_path = detect_formatter("black")
local isort_path = detect_formatter("isort")
local rustfmt_path = detect_formatter("rustfmt")

conform.setup({
	-- Defaults for every format call; per-filetype options (e.g. prisma) override them,
	-- so don't pass lsp_format explicitly to conform.format()
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = function(bufnr)
		-- Disable autoformat for certain filetypes
		local ignore_filetypes = { "sql", "java" }
		if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
			return
		end

		return { timeout_ms = 5000 }
	end,
	formatters_by_ft = {
		-- Formateadores universales (se aplican a TODOS los archivos)
		["*"] = { "trim_whitespace", "trim_newlines" },

		-- JS/TS/JSON/CSS: biome if the project has biome.json, otherwise prettier
		javascript = { "biome", "prettier", stop_after_first = true },
		typescript = { "biome", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettier", stop_after_first = true },
		json = { "biome", "prettier", stop_after_first = true },
		jsonc = { "biome", "prettier", stop_after_first = true },
		css = { "biome", "prettier", stop_after_first = true },

		-- Lenguajes específicos
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
		go = { "goimports", "gofumpt" },
		html = { "prettier" },
		markdown = { "prettier" },
		-- Formatted by their LSP (prismals runs `prisma format`)
		prisma = { lsp_format = "prefer" },
		dockerfile = { lsp_format = "prefer" },
	},
	log_level = vim.log.levels.WARN,
	notify_on_error = true,
	formatters = {
		-- biome/prettier use conform's defaults, which prefer the project's
		-- node_modules binary and its config
		biome = {
			condition = function(_, ctx)
				return vim.fs.find({ "biome.json", "biome.jsonc" }, { path = ctx.dirname, upward = true })[1] ~= nil
			end,
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
		rustfmt = {
			command = rustfmt_path,
		},
	},
})

-- prismals formats with the buffer's indent; match `prisma format` (2 spaces)
vim.api.nvim_create_autocmd("FileType", {
	pattern = "prisma",
	callback = function()
		vim.bo.shiftwidth = 2
	end,
})

-- Format keybinding - with better error handling
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	pcall(function()
		local result = require("conform").format({
			async = false,
			timeout_ms = 5000,
		})
		if result then
			vim.notify("✓ Formatted!", vim.log.levels.INFO)
		else
			vim.notify("✗ No formatter found", vim.log.levels.WARN)
		end
	end)
end, { desc = "Format file/range" })