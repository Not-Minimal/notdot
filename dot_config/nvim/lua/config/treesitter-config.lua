-- Treesitter Configuration (nvim-treesitter main branch)
-- Highlighting, indentation, textobjects and auto-closing tags

local parsers = {
	"bash",
	"css",
	"diff",
	"dockerfile",
	"fish",
	"gitcommit",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"rust",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

-- Installs missing parsers in the background (already installed ones are skipped)
require("nvim-treesitter").install(parsers)

-- Enable highlighting and indentation for any filetype with an available parser
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
	callback = function(ev)
		if pcall(vim.treesitter.start, ev.buf) then
			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})

-- Textobject motions (selection af/ic/etc. is handled by mini.ai in mini-config)
require("nvim-treesitter-textobjects").setup({
	move = { set_jumps = true },
})

local move = require("nvim-treesitter-textobjects.move")
local map = vim.keymap.set

map({ "n", "x", "o" }, "]f", function()
	move.goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function" })
map({ "n", "x", "o" }, "[f", function()
	move.goto_previous_start("@function.outer", "textobjects")
end, { desc = "Previous function" })
map({ "n", "x", "o" }, "]k", function()
	move.goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class" })
map({ "n", "x", "o" }, "[k", function()
	move.goto_previous_start("@class.outer", "textobjects")
end, { desc = "Previous class" })

-- Auto close/rename HTML & JSX tags
require("nvim-ts-autotag").setup()
