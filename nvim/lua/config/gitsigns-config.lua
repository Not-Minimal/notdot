-- Gitsigns Configuration
-- Git integration for showing changes in the sign column and git blame

require("gitsigns").setup({
	signs = {
		add = { text = "┃", hl = "GitSignsAdd" },
		change = { text = "┃", hl = "GitSignsChange" },
		delete = { text = "_", hl = "GitSignsDelete" },
		topdelete = { text = "‾", hl = "GitSignsDelete" },
		changedelete = { text = "~", hl = "GitSignsChange" },
		untracked = { text = "┆", hl = "GitSignsUntracked" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_win_col = nil, -- position to display virtual text, starting from next char
	},
	current_line_blame_formatter = " <author>, <author_time:%R> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	trouble = false, -- Use false to disable. When set to true, use the default trouble config
})

-- Gitsigns keybindings
local gs = require("gitsigns")

-- Navigation
vim.keymap.set("n", "<leader>gn", gs.next_hunk, { noremap = true, silent = true, desc = "Next hunk" })
vim.keymap.set("n", "<leader>gp", gs.prev_hunk, { noremap = true, silent = true, desc = "Previous hunk" })

-- Actions
vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { noremap = true, silent = true, desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gu", gs.undo_stage_hunk, { noremap = true, silent = true, desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { noremap = true, silent = true, desc = "Reset hunk" })
vim.keymap.set("v", "<leader>gs", function()
	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { noremap = true, silent = true, desc = "Stage selected hunk" })
vim.keymap.set("v", "<leader>gr", function()
	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { noremap = true, silent = true, desc = "Reset selected hunk" })

-- Buffer operations
vim.keymap.set("n", "<leader>gS", gs.stage_buffer, { noremap = true, silent = true, desc = "Stage buffer" })
vim.keymap.set("n", "<leader>gR", gs.reset_buffer, { noremap = true, silent = true, desc = "Reset buffer" })

-- Blame and diff
vim.keymap.set("n", "<leader>gb", gs.blame_line, { noremap = true, silent = true, desc = "Blame line" })
vim.keymap.set("n", "<leader>gB", function()
	gs.blame_line({ full = true })
end, { noremap = true, silent = true, desc = "Blame line (full)" })
vim.keymap.set("n", "<leader>gd", gs.diffthis, { noremap = true, silent = true, desc = "Diff this" })
vim.keymap.set("n", "<leader>gD", function()
	gs.diffthis("~")
end, { noremap = true, silent = true, desc = "Diff HEAD~" })

-- Preview hunk
vim.keymap.set("n", "<leader>ghp", gs.preview_hunk, { noremap = true, silent = true, desc = "Preview hunk" })
vim.keymap.set("n", "<leader>ghl", gs.preview_hunk_inline, { noremap = true, silent = true, desc = "Preview hunk inline" })

-- Toggle git features
vim.keymap.set("n", "<leader>gtd", gs.toggle_deleted, { noremap = true, silent = true, desc = "Toggle deleted" })
vim.keymap.set("n", "<leader>gtb", gs.toggle_current_line_blame, { noremap = true, silent = true, desc = "Toggle line blame" })
vim.keymap.set("n", "<leader>gts", gs.toggle_signs, { noremap = true, silent = true, desc = "Toggle signs" })
vim.keymap.set("n", "<leader>gtn", gs.toggle_numhl, { noremap = true, silent = true, desc = "Toggle numhl" })

-- Text objects
vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true, desc = "Select hunk" })
