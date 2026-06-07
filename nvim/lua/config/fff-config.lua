-- FFF Configuration
-- Ultra-fast file finder and live grep with frecency ranking
-- Replaces Telescope completely

-- Auto-build binary on install/update
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "fff.nvim" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("fff.nvim")
			end
			require("fff.download").download_or_build_binary()
		end
	end,
})

-- FFF setup
require("fff").setup({
	base_path = vim.fn.getcwd(),
	prompt = "> ",
	title = "FFF",
	max_results = 100,
	max_threads = 4,
	lazy_sync = true,
	prompt_vim_mode = false,
	follow_symlinks = false,
	enable_home_dir_scanning = true,
	enable_fs_root_scanning = false,
	layout = {
		height = 0.8,
		width = 0.8,
		prompt_position = "bottom",
		preview_position = "right",
		preview_size = 0.5,
		flex = { size = 130, wrap = "top" },
		min_list_height = 10,
		show_scrollbar = true,
		path_shorten_strategy = "middle_number",
		anchor = "center",
	},
	preview = {
		enabled = true,
		max_size = 10 * 1024 * 1024,
		chunk_size = 8192,
		binary_file_threshold = 1024,
		line_numbers = false,
		cursorlineopt = "both",
		wrap_lines = false,
		filetypes = {
			svg = { wrap_lines = true },
			markdown = { wrap_lines = true },
			text = { wrap_lines = true },
		},
	},
	keymaps = {
		close = "<Esc>",
		select = "<CR>",
		select_split = "<C-s>",
		select_vsplit = "<C-v>",
		select_tab = "<C-t>",
		move_up = { "<Up>", "<C-p>" },
		move_down = { "<Down>", "<C-n>" },
		preview_scroll_up = "<C-u>",
		preview_scroll_down = "<C-d>",
		toggle_debug = "<F2>",
		cycle_grep_modes = "<S-Tab>",
		cycle_previous_query = "<C-Up>",
		toggle_select = "<Tab>",
		send_to_quickfix = "<C-q>",
	},
	frecency = {
		enabled = true,
		db_path = vim.fn.stdpath("cache") .. "/fff_nvim",
	},
	history = {
		enabled = true,
		db_path = vim.fn.stdpath("data") .. "/fff_queries",
		min_combo_count = 3,
		combo_boost_score_multiplier = 100,
	},
	git = {
		status_text_color = false,
	},
	grep = {
		max_file_size = 10 * 1024 * 1024,
		max_matches_per_file = 100,
		smart_case = true,
		time_budget_ms = 150,
		modes = { "plain", "regex", "fuzzy" },
		trim_whitespace = false,
		location_format = ":%d:%d",
	},
	debug = {
		enabled = false,
		show_scores = false,
	},
	logging = {
		log_file = vim.fn.stdpath("log") .. "/fff.log",
		log_level = "info",
		retain_runs = 20,
	},
})

-- ==========================================
-- Utility pickers (replacing telescope builtins)
-- ==========================================

local function buffer_picker()
	local buffers = vim.api.nvim_list_bufs()
	local items = {}
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
			local name = vim.api.nvim_buf_get_name(buf)
			if name == "" then
				name = "[No Name]"
			end
			local modified = vim.api.nvim_buf_is_modified(buf) and " ●" or ""
			table.insert(items, {
				buf = buf,
				display = string.format("%3d: %s%s", buf, name, modified),
			})
		end
	end
	vim.ui.select(items, {
		prompt = "Buffers",
		format_item = function(item)
			return item.display
		end,
	}, function(choice)
		if choice then
			vim.api.nvim_set_current_buf(choice.buf)
		end
	end)
end

local function diagnostics_list()
	vim.diagnostic.setloclist()
	vim.cmd.copen()
end

local function help_search()
	vim.ui.input({ prompt = "Help topic: " }, function(input)
		if input and input ~= "" then
			vim.cmd.help(input)
		end
	end)
end

local function man_search()
	vim.ui.input({ prompt = "Man page: " }, function(input)
		if input and input ~= "" then
			vim.cmd.Man(input)
		end
	end)
end

-- ==========================================
-- Keybindings
-- ==========================================
local map = vim.keymap.set

-- File / Find (<leader><leader>, <leader>f)
map("n", "<leader><leader>", function()
	require("fff").find_files()
end, { desc = "Find files" })
map("n", "<leader>fb", buffer_picker, { desc = "Buffers" })

-- Search / Grep (<leader>s)
map("n", "<leader>sg", function()
	require("fff").live_grep()
end, { desc = "Live grep" })
map("n", "<leader>sw", function()
	require("fff").live_grep({ query = vim.fn.expand("<cword>") })
end, { desc = "Grep word" })
map("n", "<leader>sh", help_search, { desc = "Help tags" })
map("n", "<leader>sq", function()
	vim.cmd.copen()
end, { desc = "Quickfix list" })
map("n", "<leader>sd", diagnostics_list, { desc = "Diagnostics" })
map("n", "<leader>sm", man_search, { desc = "Man pages" })
map("n", "<leader>sR", function()
	vim.cmd.registers()
end, { desc = "Registers" })
map("n", "<leader>sk", function()
	vim.cmd.marks()
end, { desc = "Marks" })
map("n", "<leader>sj", function()
	vim.cmd.jumps()
end, { desc = "Jump list" })

-- Git (<leader>g) - using diffview for commits/branches
map("n", "<leader>gc", "<Cmd>DiffviewFileHistory<CR>", { desc = "Git commits (diffview)" })

-- FFF utility commands
map("n", "<leader>fs", function()
	require("fff").scan_files()
end, { desc = "FFF rescan" })
