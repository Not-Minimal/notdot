-- Enhanced Neo-tree Configuration
-- Fixes toggle behavior and improves user experience

require("neo-tree").setup({
	close_if_last_window = false,  -- Changed to false to prevent auto-close issues
	popup_border_style = "rounded",
	enable_git_status = false,  -- Disabled to prevent "too many open files" error
	enable_modified_markers = false,  -- Disabled to prevent file watching overhead
	enable_diagnostics = false,  -- Disabled to reduce overhead
	sort_case_insensitive = false,
	
	-- Window configuration
	window = {
		position = "left",
		width = 30,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = "toggle_node",
			["<2-LeftMouse>"] = "open",
			["<cr>"] = "open",
			["t"] = "open_tabnew",
			["w"] = "open_split",  -- Changed from open_window to open_split
			["C"] = "close_node",
			["z"] = "close_all_nodes",
			["a"] = {
				"add",
				config = {
					show_path = "relative",
				},
			},
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy",
			["m"] = "move",
			["q"] = "close_window",
			["R"] = "refresh",
			["?"] = "show_help",
			["<"] = "prev_source",
			[">"] = "next_source",
			["i"] = "show_file_details",
		},
	},
	
	-- Filesystem source configuration
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,  -- Changed to false to avoid recursion issues
			hide_hidden = false,
		},
		follow_current_file = {
			enabled = false,  -- Changed to false to prevent overhead
		},
		group_empty_dirs = false,
		use_libuv_file_watcher = false,  -- Disabled - this was causing "too many open files"
	},
})

-- Custom toggle function that properly closes neo-tree
function _G.toggle_neotree()
	local manager = require("neo-tree.sources.manager")
	
	-- Check if neo-tree is currently visible
	local state = manager.get_state("filesystem")
	
	if state and state.visible then
		-- If visible, close it
		vim.cmd("Neotree close")
	else
		-- If not visible, open it
		vim.cmd("Neotree toggle")
	end
end

-- Also add a direct close keybinding for when inside neo-tree
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'neo-tree',
	callback = function()
		vim.keymap.set('n', '<Esc>', function()
			vim.cmd("Neotree close")
		end, { buffer = true, noremap = true, silent = true, desc = "Close Neo-tree" })
	end,
})

