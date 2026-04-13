local wk = require("which-key")

wk.setup({
	preset = "helix",
	delay = 200,
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
})

wk.add({
	-- Leader mappings
	{ "<leader>e", ":Neotree toggle<CR>", desc = "Explorer" },
	{ "<leader><space>", ":Telescope find_files<CR>", desc = "Find Files" },
	{ "<leader>t", "<cmd>lua _toggle_terminal()<CR>", desc = "Terminal" },
	{ "<leader>T", "<cmd>lua _close_terminal_completely()<CR>", desc = "Kill Terminal" },
	
	-- Search group
	{
		"<leader>s",
		group = "Search",
		{ "<leader>sf", ":Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>sg", ":Telescope live_grep<CR>", desc = "Grep" },
		{ "<leader>sb", ":Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>sh", ":Telescope help_tags<CR>", desc = "Help" },
	},
	
	-- File group
	{
		"<leader>f",
		group = "File",
		{ "<leader>ff", ":Telescope find_files<CR>", desc = "Find" },
		{ "<leader>fr", ":Telescope oldfiles<CR>", desc = "Recent" },
		{ "<leader>fn", ":enew<CR>", desc = "New" },
	},
	
	-- Workspace/project group
	{
		"<leader>w",
		group = "Workspace",
		{ "<leader>wf", ":Oil<CR>", desc = "Oil File Manager" },
		{ "<leader>wt", "<cmd>lua _toggle_terminal()<CR>", desc = "Toggle Terminal" },
		{ "<leader>wT", "<cmd>lua _close_terminal_completely()<CR>", desc = "Kill Terminal" },
	},
	
	-- Git group
	{
		"<leader>g",
		group = "Git",
		{ "<leader>go", ":DiffviewOpen<CR>", desc = "Open Diff" },
		{ "<leader>gc", ":DiffviewClose<CR>", desc = "Close Diff" },
	},
	
	-- LSP group
	{
		"<leader>l",
		group = "LSP",
		{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
		{ "<leader>ld", vim.lsp.buf.definition, desc = "Definition" },
		{ "<leader>lD", vim.lsp.buf.declaration, desc = "Declaration" },
		{ "<leader>li", vim.lsp.buf.implementation, desc = "Implementation" },
		{ "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
		{ "<leader>lr", vim.lsp.buf.references, desc = "References" },
		{ "<leader>ln", vim.lsp.buf.rename, desc = "Rename" },
		{ "<leader>lf", function()
			vim.lsp.buf.format({ async = true })
		end, desc = "Format" },
	},
	
	-- Quit group
	{
		"<leader>q",
		group = "Quit",
		{ "<leader>qq", ":qa<CR>", desc = "Quit All" },
		{ "<leader>qw", ":wqa<CR>", desc = "Write & Quit All" },
	},
})
