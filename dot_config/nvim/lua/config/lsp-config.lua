local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"basedpyright",
		"rust_analyzer",
		"gopls",
		"vtsls",
		"eslint",
		"tailwindcss",
		"emmet_ls",
		"cssls",
		"jsonls",
		"prismals",
		"dockerls",
		"docker_compose_language_service",
	},
})

-- Non-LSP tools installed through Mason (formatters, linters, debuggers)
local mason_tools = { "goimports", "gofumpt", "golangci-lint", "delve", "gotestsum" }
local registry = require("mason-registry")
registry.refresh(function()
	for _, name in ipairs(mason_tools) do
		local ok, pkg = pcall(registry.get_package, name)
		if ok and not pkg:is_installed() then
			pkg:install()
		end
	end
end)

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

-- Enable inlay hints safely if supported by Neovim version
if vim.lsp.inlay_hint then
	pcall(function() vim.lsp.inlay_hint.enable(true) end)
end

-- LSP document colors (Tailwind classes, CSS) as an inline swatch, like nvim-highlight-colors
vim.lsp.document_color.enable(true, nil, { style = "■ " })

-- Centralized LSP Attach handler
local function on_lsp_attach(client, bufnr)
	if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		pcall(function() vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end)
	end

	-- Keymaps for LSP actions organized by groups
	local opts = { buffer = bufnr, silent = true }
	
	-- Standard fallback keys (still nice to have)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, silent = true, desc = "Go to Definition" })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, silent = true, desc = "Hover Documentation" })
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, silent = true, desc = "Go to References" })

	-- LSP Navigation Group
	vim.keymap.set('n', '<leader>cnd', vim.lsp.buf.definition, { buffer = bufnr, silent = true, desc = "Definition" })
	vim.keymap.set('n', '<leader>cnD', vim.lsp.buf.declaration, { buffer = bufnr, silent = true, desc = "Declaration" })
	vim.keymap.set('n', '<leader>cni', vim.lsp.buf.implementation, { buffer = bufnr, silent = true, desc = "Implementation" })
	vim.keymap.set('n', '<leader>cnr', vim.lsp.buf.references, { buffer = bufnr, silent = true, desc = "References" })

	-- LSP Actions Group
	vim.keymap.set('n', '<leader>caa', vim.lsp.buf.code_action, { buffer = bufnr, silent = true, desc = "Code Action" })
	vim.keymap.set('n', '<leader>caf', function()
		require("conform").format({
			async = true,
			timeout_ms = 2000,
		})
	end, { buffer = bufnr, silent = true, desc = "Format Document" })
	
	-- LSP Refactor Group
	vim.keymap.set('n', '<leader>crr', vim.lsp.buf.rename, { buffer = bufnr, silent = true, desc = "Rename Symbol" })

	-- LSP Help Group
	vim.keymap.set('n', '<leader>chh', vim.lsp.buf.hover, { buffer = bufnr, silent = true, desc = "Hover Documentation" })
	vim.keymap.set('n', '<leader>chs', vim.lsp.buf.signature_help, { buffer = bufnr, silent = true, desc = "Signature Help" })

	-- LSP Diagnostics Group
	vim.keymap.set('n', '<leader>cdd', vim.diagnostic.open_float, { buffer = bufnr, silent = true, desc = "Line Diagnostics" })
	vim.keymap.set('n', '<leader>cdn', vim.diagnostic.goto_next, { buffer = bufnr, silent = true, desc = "Next Diagnostic" })
	vim.keymap.set('n', '<leader>cdp', vim.diagnostic.goto_prev, { buffer = bufnr, silent = true, desc = "Previous Diagnostic" })
	vim.keymap.set('n', '<leader>cdq', vim.diagnostic.setloclist, { buffer = bufnr, silent = true, desc = "Diagnostics Quickfix" })
	
	-- LSP Symbols Group (Handled mostly via telescope if you have it, but standard fallback)
	vim.keymap.set('n', '<leader>css', vim.lsp.buf.document_symbol, { buffer = bufnr, silent = true, desc = "Document Symbols" })
	vim.keymap.set('n', '<leader>csw', vim.lsp.buf.workspace_symbol, { buffer = bufnr, silent = true, desc = "Workspace Symbols" })
end

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			on_lsp_attach(client, args.buf)
		end
	end,
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

-- Configure individual language servers using the native vim.lsp.config()
-- This is required by the newest version of mason-lspconfig for Nvim 0.12+

-- Add a default config hook for all servers if you wanted, but capabilities need to be set individually
vim.lsp.config('*', {
	capabilities = capabilities,
})

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

-- vtsls: TypeScript LSP (replaces ts_ls), faster on large Next.js projects
local ts_settings = {
	inlayHints = {
		parameterNames = { enabled = "all" },
		parameterTypes = { enabled = true },
		variableTypes = { enabled = true },
		propertyDeclarationTypes = { enabled = true },
		functionLikeReturnTypes = { enabled = true },
		enumMemberValues = { enabled = true },
	},
	preferences = {
		quoteStyle = "single",
		importModuleSpecifier = "relative",
	},
	updateImportsOnFileMove = { enabled = "always" },
	suggest = { completeFunctionCalls = true },
}

vim.lsp.config('vtsls', {
	capabilities = capabilities,
	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			enableMoveToFileCodeAction = true,
		},
		typescript = ts_settings,
		javascript = ts_settings,
	},
})

vim.lsp.config('gopls', {
	capabilities = capabilities,
	settings = {
		gopls = {
			gofumpt = true,
			staticcheck = true,
			usePlaceholders = true,
			completeUnimported = true,
			analyses = {
				unusedparams = true,
				unusedwrite = true,
				nilness = true,
				shadow = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
})

vim.lsp.config('jsonls', {
	capabilities = capabilities,
	settings = {
		json = {
			-- package.json, tsconfig.json, .eslintrc, etc. from schemastore.org
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

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

vim.lsp.config('eslint', {
	capabilities = capabilities,
	settings = {
		eslint = {
			validate = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
			packageManager = 'npm',
		},
	},
})

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
