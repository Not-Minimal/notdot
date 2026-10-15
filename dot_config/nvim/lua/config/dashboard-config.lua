-- Enhanced Dashboard Configuration for Alpha
-- More functional and interactive startup screen

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = vim.split(
	[[
	(⌐■_■)                (⌐■_■)             (⌐■_■)        (⌐■_■)

██   ██  █████  ██████  ███████ ██    ██     ███████ ████████ ██    ██ ██████  ██  ██████
██  ██  ██   ██ ██   ██ ██      ██    ██     ██         ██    ██    ██ ██   ██ ██ ██    ██
█████   ███████ ██   ██ █████   ██    ██     ███████    ██    ██    ██ ██   ██ ██ ██    ██
██  ██  ██   ██ ██   ██ ██       ██  ██           ██    ██    ██    ██ ██   ██ ██ ██    ██
██   ██ ██   ██ ██████  ███████   ████       ███████    ██     ██████  ██████  ██  ██████

(⌐■_■)                             (⌐■_■)          (⌐■_■)
        ]],
	"\n",
	{ trimempty = true }
)
dashboard.section.header.opts.hl = "Comment"

-- Create buttons with useful actions
local buttons = {
	dashboard.button("n", "   New File", "<cmd>enew<CR>"),
	dashboard.button("f", "   Find File", "<cmd>lua require('fff').find_files()<CR>"),
	dashboard.button("r", "   Recent Files", "<cmd>lua require('config.fff-config').recent()<CR>"),
	dashboard.button("g", "   Live Grep", "<cmd>lua require('fff').live_grep()<CR>"),
	dashboard.button("b", "   Buffers", "<cmd>lua require('config.fff-config').buffers()<CR>"),
	dashboard.button("h", "   Help Tags", "<cmd>lua require('config.fff-config').help()<CR>"),
	dashboard.button("c", "   Config", "<cmd>lua require('fff').find_files_in_dir(vim.fn.stdpath('config'))<CR>"),
	dashboard.button("l", "   LSP Info", "<cmd>LspInfo<CR>"),
	dashboard.button("m", "   Update Plugins", "<cmd>lua vim.pack.update()<CR>"),
	dashboard.button("t", "   Restore Session", "<cmd>source ~/.config/nvim/session.vim<CR>"),
	dashboard.button("q", "   Quit Neovim", "<cmd>qa<CR>"),
}

local footer_val = {
	"",
	"─────────────────────────────────────────────",
	"NotMinimal | Neovim " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
	"https://github.com/Not-Minimal/notdot",
	"─────────────────────────────────────────────",
}

dashboard.section.buttons.val = buttons
dashboard.section.footer.val = footer_val
dashboard.section.footer.opts.hl = "Comment"

-- Set highlight groups
dashboard.section.header.opts.hl = "Statement"

-- Configure padding
dashboard.config.opts.noautocmd = true

-- Setup alpha
alpha.setup(dashboard.opts)

-- Disable statusline when showing dashboard
vim.cmd([[autocmd FileType alpha setlocal laststatus=0 | autocmd BufLeave <buffer> setlocal laststatus=3]])
