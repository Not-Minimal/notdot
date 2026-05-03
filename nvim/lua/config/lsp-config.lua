-- LSP Configuration for Neovim 0.12+
-- This file handles all LSP setup with optimizations for performance and UX

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Enhanced capabilities
capabilities = vim.tbl_deep_extend(
	'force',
	capabilities,
	{
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
					resolveSupport = {
						properties = { 'documentation', 'detail', 'additionalTextEdits' }
					}
				}
			},
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}
		},
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true
			}
		}
	}
)

-- Enable inlay hints globally (Nvim 0.12+)
vim.lsp.inlay_hint.enable(true)

-- Centralized on_attach handler
local function on_lsp_attach(client, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, noremap = true, silent = true })
	end

	-- Basic Navigation (always available)
	map('n', 'K', vim.lsp.buf.hover, 'Hover Info')
	map('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Help')

	-- Navigation keymaps
	map('n', '<leader>lnd', vim.lsp.buf.definition, 'Go to Definition')
	map('n', '<leader>lnD', vim.lsp.buf.declaration, 'Go to Declaration')
	map('n', '<leader>lni', vim.lsp.buf.implementation, 'Go to Implementation')
	map('n', '<leader>lnr', vim.lsp.buf.references, 'References')
	map('n', '<leader>lnt', vim.lsp.buf.type_definition, 'Type Definition')

	-- Refactoring keymaps
	map('n', '<leader>lrn', vim.lsp.buf.rename, 'Rename Symbol')
	map({ 'n', 'v' }, '<leader>lra', vim.lsp.buf.code_action, 'Code Action')
	map('n', '<leader>lrf', function()
		vim.lsp.buf.format({ async = true })
	end, 'Format Buffer')

	-- Imports keymaps
	map('n', '<leader>lio', function()
		vim.lsp.buf.code_action({
			context = {
				only = { "source.organizeImports" }
			},
			apply = true
		})
	end, 'Organize Imports')

	map('n', '<leader>liu', function()
		vim.lsp.buf.code_action({
			context = {
				only = { "source.removeUnused" }
			},
			apply = true
		})
	end, 'Remove Unused Imports')

	map('n', '<leader>lim', function()
		vim.lsp.buf.code_action({
			context = {
				only = { "source.addMissingImports" }
			},
			apply = true
		})
	end, 'Add Missing Imports')

	-- Symbols/Outline keymaps
	map('n', '<leader>lsd', function()
		if package.loaded['snacks'] then
			Snacks.picker.lsp_symbols()
		else
			vim.lsp.buf.document_symbol()
		end
	end, 'Document Symbols')

	map('n', '<leader>lsw', function()
		if package.loaded['snacks'] then
			Snacks.picker.lsp_workspace_symbols()
		else
			vim.lsp.buf.workspace_symbol()
		end
	end, 'Workspace Symbols')

	-- Calls keymaps
	map('n', '<leader>lci', function()
		if package.loaded['snacks'] then
			Snacks.picker.lsp_incoming_calls()
		else
			vim.lsp.buf.incoming_calls()
		end
	end, 'Incoming Calls')

	map('n', '<leader>lco', function()
		if package.loaded['snacks'] then
			Snacks.picker.lsp_outgoing_calls()
		else
			vim.lsp.buf.outgoing_calls()
		end
	end, 'Outgoing Calls')

	-- Diagnostics keymaps
	map('n', '<leader>ldo', vim.diagnostic.open_float, 'Open Diagnostic Float')
	map('n', '<leader>ldp', vim.diagnostic.goto_prev, 'Previous Diagnostic')
	map('n', '<leader>ldn', vim.diagnostic.goto_next, 'Next Diagnostic')

	map('n', '<leader>lda', function()
		if package.loaded['snacks'] then
			Snacks.picker.diagnostics()
		else
			vim.diagnostic.setloclist()
		end
	end, 'All Diagnostics')

	map('n', '<leader>ldb', function()
		if package.loaded['snacks'] then
			Snacks.picker.diagnostics_buffer()
		else
			vim.diagnostic.setqflist()
		end
	end, 'Buffer Diagnostics')

	-- Help keymaps
	map('n', '<leader>lhh', vim.lsp.buf.hover, 'Hover Info')
	map('n', '<leader>lhs', vim.lsp.buf.signature_help, 'Signature Help')
end

-- LSP Attach autocmd - Centralizado
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		on_lsp_attach(client, args.buf)
	end,
})

-- Configure individual language servers
-- Lua
vim.lsp.config('lua_ls', {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim', '_G' } },
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					'${3rd}/luv/library',
				},
			},
			telemetry = { enable = false },
			hint = {
				enable = true,
				arrayIndex = "Disable",
			},
		},
	},
})

-- TypeScript / JavaScript
vim.lsp.config('ts_ls', {
	capabilities = capabilities,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = 'all',
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeIsAmbiguous = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
			preferences = {
				quotePreference = 'single',
				importModuleSpecifierPreference = 'relative',
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = 'all',
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})

-- Rust
vim.lsp.config('rust_analyzer', {
	capabilities = capabilities,
	settings = {
		['rust-analyzer'] = {
			assist = {
				importGranularity = "module",
				importPrefix = "crate",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
			inlayHints = {
				enable = true,
				chainingHints = true,
				parameterHints = true,
				typeHints = true,
				hideNamedConstructorHints = false,
			},
		},
	},
})

-- Python (BasedPyright)
vim.lsp.config('basedpyright', {
	capabilities = capabilities,
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
				diagnosticMode = "workspace",
			},
		},
	},
})

-- Prisma
vim.lsp.config('prisma', {
	capabilities = capabilities,
	cmd = { 'prisma-language-server', '--stdio' },
	filetypes = { 'prisma' },
	root_dir = require('lspconfig.util').root_pattern('.git', 'package.json', 'schema.prisma'),
})

-- Emmet
vim.lsp.config('emmet_ls', {
	capabilities = capabilities,
	filetypes = { 'html', 'css', 'scss', 'javascriptreact', 'typescriptreact', 'php', 'heex', 'elixir' },
})

-- ESLint
vim.lsp.config('eslint', {
	capabilities = capabilities,
	settings = {
		eslint = {
			validate = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
			packageManager = 'npm',
		},
	},
})

-- TailwindCSS
vim.lsp.config('tailwindcss', {
	capabilities = capabilities,
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`|\\()((?:\\\\.|(?!\\\\).))*?(?:'|\"|`|\\))" },
					{ "classNames\\(([^)]*)\\)", "'(?:\\\\.|(?!'\\).|[^'\\])*)'|\"(?:\\\\.|(?!\"\\).|[^\"\\])*)?|`(?:\\\\.|(?!`\\).|[^`\\])*)?|(\\([^)]*\\))" },
				},
			},
		},
	},
})

-- Optimized Diagnostic Configuration
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = 'rounded',
		source = 'if_many',
		max_width = 80,
	},
	underline = true,
	virtual_text = {
		spacing = 2,
		source = 'if_many',
		prefix = '●',
	},
	signs = true,
})

-- Enable LSP servers
vim.lsp.enable({
	'lua_ls',
	'ts_ls',
	'rust_analyzer',
	'basedpyright',
	'prisma',
	'emmet_ls',
	'eslint',
	'tailwindcss',
})
