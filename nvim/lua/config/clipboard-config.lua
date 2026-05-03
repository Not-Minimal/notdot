-- Clipboard Configuration for macOS
-- Seamless integration between Neovim and macOS system clipboard
-- Yank in Neovim → Paste in macOS apps
-- Copy in macOS apps → Paste in Neovim

-- Configure to use macOS clipboard via pbcopy/pbpaste
vim.g.clipboard = {
	name = "macOS-clipboard",
	copy = {
		["+"] = "pbcopy",
		["*"] = "pbcopy",
	},
	paste = {
		["+"] = "pbpaste",
		["*"] = "pbpaste",
	},
	cache_enabled = true,
}

-- Set clipboard option to use unnamedplus
-- This makes all yank operations go directly to system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

