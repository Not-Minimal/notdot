-- Telescope Configuration with Extensions
-- Enhanced telescope setup with frecency, fzf-native, and custom keybindings

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

-- Setup telescope with extensions
telescope.setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		preview = {
			msg_bg_fillchar = "╭",
		},
		file_ignore_patterns = {
			"node_modules",
			"%.git/",
			"%.cache",
			"dist",
			"build",
			"__pycache__",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
		frecency = {
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = {
				"*/node_modules/*",
				"*/.git/*",
			},
			disable_devicons = false,
			workspaces = {
				["conf"] = "/home/user/.config",
				["data"] = "/home/user/.local/share",
				["project"] = "/home/user/projects",
			},
		},
	},
})

-- Load extensions
telescope.load_extension("ui-select")
telescope.load_extension("frecency")

-- Telescope keybindings
local map = vim.keymap.set

-- Find files
map("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })
map("n", "<leader>fF", function()
	builtin.find_files({ hidden = true, no_ignore = true })
end, { noremap = true, silent = true, desc = "Find all files" })

-- Recent files (frecency)
map("n", "<leader>fr", telescope.extensions.frecency.frecency, { noremap = true, silent = true, desc = "Recent files" })

-- Search text
map("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true, desc = "Live grep" })
map("n", "<leader>fG", function()
	builtin.live_grep({ additional_args = function()
		return { "--hidden" }
	end })
end, { noremap = true, silent = true, desc = "Live grep (hidden)" })

-- Search word under cursor
map("n", "<leader>fw", builtin.grep_string, { noremap = true, silent = true, desc = "Grep word" })

-- Buffers
map("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true, desc = "Buffers" })

-- Git commands
map("n", "<leader>fgc", builtin.git_commits, { noremap = true, silent = true, desc = "Git commits" })
map("n", "<leader>fgb", builtin.git_branches, { noremap = true, silent = true, desc = "Git branches" })
map("n", "<leader>fgs", builtin.git_status, { noremap = true, silent = true, desc = "Git status" })

-- Help
map("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true, desc = "Help tags" })

-- Quickfix
map("n", "<leader>fq", builtin.quickfix, { noremap = true, silent = true, desc = "Quickfix" })

-- LSP
map("n", "<leader>fld", builtin.lsp_definitions, { noremap = true, silent = true, desc = "LSP definitions" })
map("n", "<leader>fli", builtin.lsp_implementations, { noremap = true, silent = true, desc = "LSP implementations" })
map("n", "<leader>flr", builtin.lsp_references, { noremap = true, silent = true, desc = "LSP references" })
map("n", "<leader>fls", builtin.lsp_document_symbols, { noremap = true, silent = true, desc = "LSP document symbols" })
map("n", "<leader>flw", builtin.lsp_workspace_symbols, { noremap = true, silent = true, desc = "LSP workspace symbols" })

-- Diagnostics
map("n", "<leader>fde", builtin.diagnostics, { noremap = true, silent = true, desc = "Diagnostics" })

-- Man pages
map("n", "<leader>fm", builtin.man_pages, { noremap = true, silent = true, desc = "Man pages" })

-- Registers
map("n", "<leader>freg", builtin.registers, { noremap = true, silent = true, desc = "Registers" })

-- Marks
map("n", "<leader>fmk", builtin.marks, { noremap = true, silent = true, desc = "Marks" })

-- Jump list
map("n", "<leader>fjl", builtin.jumplist, { noremap = true, silent = true, desc = "Jump list" })
