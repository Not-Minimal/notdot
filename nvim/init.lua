-- ==============================================================================
-- CORE SETTINGS
-- ==============================================================================
-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.o.number = true
vim.opt.relativenumber = true
vim.o.smartindent = true

vim.o.background = "dark"
vim.o.backup = false
vim.o.expandtab = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.number = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.softtabstop = 4
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 100
vim.o.winborder = "rounded"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
-- ==============================================================================
-- KEYMAPS
-- ==============================================================================
--: Basic keymaps
-- Split window
vim.keymap.set("n", "qq", ":split<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return>", { noremap = true, silent = true })
-- Global keymaps (window navigation and file explorer)
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


-- ==============================================================================
-- PLUGINS (MANAGEMENT)
-- ==============================================================================
-- Plugins
vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-frecency.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp",                       version = "v1.6.0" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/wakatime/vim-wakatime" },
	{ src = "https://github.com/sam4llis/nvim-tundra" },
	{ src = "https://github.com/ayu-theme/ayu-vim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git" },
	{ src = 'https://github.com/nvim-tree/nvim-tree.lua' },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/goolord/alpha-nvim" },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/folke/which-key.nvim" },

			{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },


	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }
})


-- ==============================================================================
-- UI & APPEARANCE
-- ==============================================================================
-- Colorscheme (now handled by theme-config)
require("config.theme-config")

require('vim._core.ui2').enable({
	enable = true,
	msg = {
		target = "cmd", -- options: cmd(classic), msg(similar to noice)
		pager  = { height = 1 },
		msg    = { height = 0.5, timeout = 4500 },
		dialog = { height = 0.5 },
		cmd    = { height = 0.5 },
	},
})


-- ==============================================================================
-- PLUGIN CONFIGURATIONS
-- ==============================================================================
-- Core utilities
require("config.blink-config")
require("config.supermaven-config")
require("config.conform-config")
require("config.which-key-config")

-- nvim-notify setup
require("notify").setup({
	render = "minimal",
	animation = {
		style = "slide",
	},
	top_down = false,
	timeout = 2000,
})
-- Noice setup
require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
})

-- External configurations
require("config.autopairs-config")
-- Lualine setup
require("config.lualine-config")
-- Mason and LSP setup
require("config.lsp-config")
-- Telescope setup
require("config.telescope-config")
-- Nvim-tree setup
require("config.nvim-tree-config")
-- Enhanced Dashboard with more functionality
require('config.dashboard-config')
-- Gitsigns setup (git line changes)
require("config.gitsigns-config")
-- Git DiffView Config
require("config.diffview-config")
