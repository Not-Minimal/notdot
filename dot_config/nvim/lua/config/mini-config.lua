-- Mini.nvim Configuration
-- mini.ai: extended a/i textobjects | mini.surround: add/delete/replace surroundings

local ai = require("mini.ai")
ai.setup({
	n_lines = 500,
	custom_textobjects = {
		-- Treesitter based (needs nvim-treesitter-textobjects queries)
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
		o = ai.gen_spec.treesitter({
			a = { "@block.outer", "@conditional.outer", "@loop.outer" },
			i = { "@block.inner", "@conditional.inner", "@loop.inner" },
		}),
	},
})

-- Default mappings: sa (add), sd (delete), sr (replace), sf/sF (find), sh (highlight)
require("mini.surround").setup()
