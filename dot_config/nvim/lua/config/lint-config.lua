-- nvim-lint Configuration
-- Linters that don't have an LSP (diagnostics show up like LSP ones)

local lint = require("lint")

lint.linters_by_ft = {
	go = { "golangcilint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
	callback = function()
		-- Skip silently when the linter isn't installed yet
		lint.try_lint(nil, { ignore_errors = true })
	end,
})
