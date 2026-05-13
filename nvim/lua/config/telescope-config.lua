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

-- ==========================================
-- File / Buffers (<leader>f)
-- ==========================================
map("n", "<leader><leader>", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })
map("n", "<leader>fF", function()
	builtin.find_files({ hidden = true, no_ignore = true })
end, { noremap = true, silent = true, desc = "Find all files" })
map("n", "<leader>fr", telescope.extensions.frecency.frecency, { noremap = true, silent = true, desc = "Recent files" })
map("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true, desc = "Buffers" })

-- ==========================================
-- Search / Grep (<leader>s)
-- ==========================================
map("n", "<leader>sg", builtin.live_grep, { noremap = true, silent = true, desc = "Live grep" })
map("n", "<leader>sG", function()
	builtin.live_grep({
		additional_args = function()
			return { "--hidden" }
		end,
	})
end, { noremap = true, silent = true, desc = "Live grep (hidden)" })
map("n", "<leader>sw", builtin.grep_string, { noremap = true, silent = true, desc = "Grep word" })
map("n", "<leader>sh", builtin.help_tags, { noremap = true, silent = true, desc = "Help tags" })
map("n", "<leader>sq", builtin.quickfix, { noremap = true, silent = true, desc = "Quickfix" })
map("n", "<leader>sd", builtin.diagnostics, { noremap = true, silent = true, desc = "Diagnostics" })
map("n", "<leader>sm", builtin.man_pages, { noremap = true, silent = true, desc = "Man pages" })
map("n", "<leader>sR", builtin.registers, { noremap = true, silent = true, desc = "Registers" })
map("n", "<leader>sk", builtin.marks, { noremap = true, silent = true, desc = "Marks" })
map("n", "<leader>sj", builtin.jumplist, { noremap = true, silent = true, desc = "Jump list" })

-- ==========================================
-- Git (<leader>g)
-- ==========================================
map("n", "<leader>gc", builtin.git_commits, { noremap = true, silent = true, desc = "Git commits" })
map("n", "<leader>gb", builtin.git_branches, { noremap = true, silent = true, desc = "Git branches" })
map("n", "<leader>gs", builtin.git_status, { noremap = true, silent = true, desc = "Git status" })
