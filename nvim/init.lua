vim.g.mapleader = " "
vim.o.background = "dark"
vim.o.backup = false
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.number = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.winborder = "rounded"
vim.o.wrap = false

-- Plugins
vim.pack.add({
	{ src = "https://github.com/sam4llis/nvim-tundra" },
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git" },
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
	{ src = "https://github.com/echasnovski/mini.files" },
	{ src = "https://github.com/stevearc/oil.nvim.git" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"},
	{ src = "https://github.com/akinsho/toggleterm.nvim"},
})
require("toggleterm").setup({
	direction = "float",}
)
-- Colorscheme
vim.cmd.colorscheme "tundra"

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

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "basedpyright", "rust_analyzer", "emmet_ls", "eslint", "ts_ls", "tailwindcss" },
})

-- nvim-tree setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_modified_markers = true,
        enable_diagnostics = true,
        sort_case_insensitive = false,
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
            ["w"] = "open_window",
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
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = false,
          },
          follow_current_file = {
            enabled = true,
          },
          group_empty_dirs = false,
          use_libuv_file_watcher = true,
        },
      })
-- blink.cmp setup
require("blink.cmp").setup({
	keymap = { preset = 'default' },
	appearance = {
		nerd_font_variant = 'mono'
	},
	completion = { documentation = { auto_show = true } },
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},
	fuzzy = { implementation = "prefer_rust" }
})

-- Supermaven setup
require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<Tab>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
  ignore_filetypes = { cpp = true },
  color = {
    suggestion_color = "#ffffff",
    cterm = 244,
  },
  log_level = "info",
  disable_inline_completion = false,
  disable_keymaps = false,
  condition = function()
    return false
  end,
})

-- Conform setup
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "biome" },
		json = { "biome" },
		rust = { "biome" },
		python = { "biome" },
		htmldjango = { "biome" },
		javascript = { "biome" },
		typescript = { "biome" },
	},
})

-- Lualine setup
require('lualine').setup({
	options = {
		theme = 'tundra',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			{
				'branch',
				fmt = function(str)
					if #str > 5 then
						return str:sub(1, 5) .. '…'
					end
					return str
				end
			},
			'diff'
		},
		lualine_c = {
			{
				'filename',
				path = 1,
				file_status = true,
				fmt = function(str)
					local sep = package.config:sub(1, 1)
					local parts = {}

					for part in string.gmatch(str, "([^" .. sep .. "]+)") do
						table.insert(parts, part)
					end

					if #parts == 1 then
						return parts[1]
					end

					local result = {}
					for i = 1, #parts - 1 do
						table.insert(result, parts[i]:sub(1, 1))
					end

					table.insert(result, parts[#parts])
					return table.concat(result, sep)
				end,
			}
		},
		lualine_x = { 'diagnostics', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	tabline = {},
	inactive_sections = {
		lualine_c = { { 'filename', path = 1, file_status = true } },
	},
	extensions = {}
})

-- Mini.files setup
require('mini.files').setup()

-- Oil setup
require('oil').setup()

-- nvim-notify setup
require("notify").setup({
	render = "minimal",
	animation = {
		style = "slide",
	},
	top_down = false,
	timeout = 2000,
})

-- Tiny inline diagnostics setup
require("tiny-inline-diagnostic").setup({
    preset = "minimal",
    transparent_bg = false,
    transparent_cursorline = true,
    hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine",
        mixing_color = "Normal",
    },
    disabled_ft = {},
    options = {
        show_source = {
            enabled = false,
            if_many = false,
        },
        show_code = true,
        use_icons_from_diagnostic = false,
        set_arrow_to_diag_color = false,
        throttle = 20,
        softwrap = 30,
        add_messages = {
            messages = true,
            display_count = false,
            use_max_severity = false,
            show_multiple_glyphs = true,
        },
        multilines = {
            enabled = false,
            always_show = false,
            trim_whitespaces = false,
            tabstop = 4,
            severity = nil,
          },
        show_all_diags_on_cursorline = false,
        show_diags_only_under_cursor = false,
        show_related = {
            enabled = true,
            max_count = 3,
        },
        enable_on_insert = false,
        enable_on_select = false,
        overflow = {
            mode = "wrap",
            padding = 0,
        },
        break_line = {
            enabled = false,
            after = 30,
        },
        format = nil,
        virt_texts = {
            priority = 2048,
        },
        severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
        },
        overwrite_events = nil,
        override_open_float = false,
        experimental = {
          use_window_local_extmarks = false,
        },
    },
})

-- LSP Configuration (Neovim 0.12 native)
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config('lua_ls', {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim' } },
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config('ts_ls', {
	capabilities = capabilities,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = 'all',
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

vim.lsp.config('rust_analyzer', {
	capabilities = capabilities,
})

vim.lsp.config('basedpyright', {
	capabilities = capabilities,
})

-- Enable LSP servers
vim.lsp.enable({
	'lua_ls',
	'ts_ls',
	'rust_analyzer',
	'basedpyright',
})

-- Diagnostic configuration
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = 'rounded',
		source = 'if_many',
	},
	underline = true,
	virtual_text = {
		spacing = 2,
		source = 'if_many',
		prefix = '●',
	},
})

--: Basic keymaps
-- Global keymaps (window navigation and file explorer)
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set('n', '<Space><Space>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
--:

-- LSP keymaps on attach
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local bufnr = args.buf
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, noremap = true, silent = true })
		end

		map('n', 'K', vim.lsp.buf.hover, 'LSP Hover')
		map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
		map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
		map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
		map('n', 'gr', vim.lsp.buf.references, 'References')
		map('n', '<Space>rn', vim.lsp.buf.rename, 'Rename symbol')
		map({ 'n', 'v' }, '<Space>ca', vim.lsp.buf.code_action, 'Code action')
		map('n', '<Space>f', function()
			vim.lsp.buf.format({ async = true })
		end, 'Format buffer')
	end,
})

require('nvim-tundra').setup({
  plugins = {
    telescope = true,
  },
})

