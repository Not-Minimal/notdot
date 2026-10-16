-- nvim-highlight-colors Configuration
-- Shows hex/rgb/hsl colors inline. Tailwind class colors come from the
-- Tailwind LSP via Neovim's native vim.lsp.document_color (lsp-config)

require("nvim-highlight-colors").setup({
	render = "virtual",
	virtual_symbol = "■",
	virtual_symbol_position = "inline",
	enable_tailwind = false,
})
