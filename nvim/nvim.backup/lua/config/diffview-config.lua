-- Diffview Configuration
-- Enhanced git diff viewer with split layouts

require("diffview").setup({
	diff_binaries = false,
	enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
	git_cmd = { "git" }, -- The git executable followed by default args.
	hg_cmd = { "hg" }, -- The hg executable followed by default args.
	use_icons = true, -- Requires nvim-web-devicons
	show_help_hints = true, -- Show hints about keybindings when opening Diffview
	watch_index = true, -- Watches files in the working directory state and recompiles diffs.
	icons = { -- Only applies when use_icons is true.
		folder_closed = "",
		folder_open = "",
	},
	signs = {
		fold_closed = "",
		fold_open = "",
		done = "✓",
	},
	view = {
		-- Configure the layout and behavior of different views.
		-- See the configuration sections below for detailed options.
		default = {
			-- Config for changed files, and staged files in diff views.
			layout = "diff2_horizontal",
			winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
		},
		merge_tool = {
			-- Config for conflicted files in diff views during a merge or rebase.
			layout = "diff3_horizontal",
			disable_diagnostics = true, -- Temporarily disable diagnostics to avoid noise while resolving conflicts
			winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
		},
		file_history = {
			-- Config for changed files in file history views.
			layout = "diff2_horizontal",
			winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
		},
	},
	file_panel = {
		listing_style = "tree", -- One of 'list' or 'tree'
		tree_options = { -- Only applies when listing_style is 'tree'
			flatten_dirs = true, -- Flatten dirs that only contain one dir
			folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
		},
		win_config = { -- See ':h diffview-config-win_config'
			position = "left",
			width = 35,
			win_opts = {},
		},
	},
	file_history_panel = {
		win_config = { -- See ':h diffview-config-win_config'
			position = "bottom",
			height = 16,
			win_opts = {},
		},
	},
	hooks = {}, -- See ':h diffview-config-hooks'
	keymaps = {
		disable_defaults = false, -- Disable the default key mappings
		view = {
			-- The `view` bindings are active in the diff buffers, only when the current
			-- tabpage is showing a view.
			["<tab>"] = "select_next_entry", -- Open the diff for the next file
			["<s-tab>"] = "select_prev_entry", -- Open the diff for the previous file
			["gf"] = "goto_file", -- Open the file in a new split in previous tabpage
			["<C-w><C-f>"] = "goto_file_split", -- Open the file in a new split
			["<C-w>gf"] = "goto_file_tab", -- Open the file in a new tabpage
			["<leader>e"] = "focus_files", -- Bring focus to the file panel
			["<leader>b"] = "toggle_files", -- Toggle the file panel.
		},
		diff1 = {
			-- Mappings in single window diff layouts
			["g?"] = "help",
		},
		diff2 = {
			-- Mappings in 2-way diff layouts
			["g?"] = "help",
		},
		diff3 = {
			-- Mappings in 3-way diff layouts
			{ "3do", "diff_obtain", 3 }, -- Obtain the diff from the MERGED version
			{ "2do", "diff_obtain", 2 }, -- Obtain the diff from the OURS version
			{ "1do", "diff_obtain", 1 }, -- Obtain the diff from the THEIRS version
			["dx"] = "diff_none", -- Obtain the diff from the MERGED version
			["dX"] = "diff_none",
			["do"] = "diff_obtain",
			["dn"] = "diff_none",
			["du"] = "diff_ours",
			["dT"] = "diff_theirs",
			["dm"] = "diff_base",
			["g?"] = "help",
		},
		file_panel = {
			["j"] = "next_entry", -- Bring the cursor to the next file entry
			["<down>"] = "next_entry",
			["k"] = "prev_entry", -- Bring the cursor to the previous file entry.
			["<up>"] = "prev_entry",
			["<cr>"] = "select_entry", -- Open the diff for the selected entry.
			["o"] = "select_entry",
			["<2-LeftMouse>"] = "select_entry",
			["-"] = "toggle_stage_entry", -- Stage / unstage the selected entry.
			["s"] = "toggle_stage_entry",
			["S"] = "stage_all", -- Stage all entries.
			["U"] = "unstage_all", -- Unstage all entries.
			["X"] = "restore_entry", -- Restore entry to the state on the left side.
			["R"] = "refresh_files", -- Update stats and entries in the file list.
			["<tab>"] = "select_next_entry",
			["<s-tab>"] = "select_prev_entry",
			["gf"] = "goto_file",
			["<C-w><C-f>"] = "goto_file_split",
			["<C-w>gf"] = "goto_file_tab",
			["i"] = "listing_style", -- Toggle between 'list' and 'tree' views
			["h"] = "toggle_fold",
			["g?"] = "help",
		},
		file_history_panel = {
			["g!"] = "options", -- Open the option panel
			["<C-A>"] = "open_all_folds",
			["<C-X>"] = "close_all_folds",
			["zR"] = "open_all_folds",
			["zM"] = "close_all_folds",
			["j"] = "next_entry",
			["<down>"] = "next_entry",
			["k"] = "prev_entry",
			["<up>"] = "prev_entry",
			["<cr>"] = "select_entry",
			["o"] = "select_entry",
			["<2-LeftMouse>"] = "select_entry",
			["<tab>"] = "select_next_entry",
			["<s-tab>"] = "select_prev_entry",
			["gf"] = "goto_file",
			["<C-w><C-f>"] = "goto_file_split",
			["<C-w>gf"] = "goto_file_tab",
			["zf"] = "toggle_fold",
			["g?"] = "help",
		},
	},
})

-- Diffview keybindings
local map = vim.keymap.set

map("n", "<leader>dvo", "<Cmd>DiffviewOpen<CR>", { noremap = true, silent = true, desc = "Diffview open" })
map("n", "<leader>dvf", "<Cmd>DiffviewFileHistory<CR>", { noremap = true, silent = true, desc = "File history" })
map("n", "<leader>dvh", "<Cmd>DiffviewFileHistory %<CR>", { noremap = true, silent = true, desc = "Buffer history" })
map("n", "<leader>dvc", "<Cmd>DiffviewClose<CR>", { noremap = true, silent = true, desc = "Diffview close" })
map("n", "<leader>dvt", "<Cmd>DiffviewToggleFiles<CR>", { noremap = true, silent = true, desc = "Toggle file panel" })
map("n", "<leader>dvr", "<Cmd>DiffviewRefresh<CR>", { noremap = true, silent = true, desc = "Refresh" })
