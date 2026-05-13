-- Enhanced Dashboard Configuration for Alpha
-- More functional and interactive startup screen

local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Set header
dashboard.section.header.val = vim.split(
	[[
	(⌐■_■)       (⌐■_■)         (⌐■_■)             (⌐■_■)        (⌐■_■)

     ███╗   ██╗ ██████╗ ████████╗███╗   ███╗██╗███╗   ██╗██╗███╗   ███╗ █████╗ ██╗
     ████╗  ██║██╔═══██╗╚══██╔══╝████╗ ████║██║████╗  ██║██║████╗ ████║██╔══██╗██║
     ██╔██╗ ██║██║   ██║   ██║   ██╔████╔██║██║██╔██╗ ██║██║██╔████╔██║███████║██║
     ██║╚██╗██║██║   ██║   ██║   ██║╚██╔╝██║██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║██║
     ██║ ╚████║╚██████╔╝   ██║   ██║ ╚═╝ ██║██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║███████╗
     ╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝
                (⌐■_■)                        (⌐■_■)             (⌐■_■)


        ]], '\n', { trimempty = true })
dashboard.section.header.opts.hl = 'Comment'

-- Create buttons with useful actions
local buttons = {
	dashboard.button('n', '   New File', '<cmd>enew<CR>'),
	dashboard.button('f', '   Find File', '<cmd>Telescope find_files<CR>'),
	dashboard.button('r', '   Recent Files', '<cmd>Telescope oldfiles<CR>'),
	dashboard.button('g', '   Live Grep', '<cmd>Telescope live_grep<CR>'),
	dashboard.button('b', '   Buffers', '<cmd>Telescope buffers<CR>'),
	dashboard.button('h', '   Help Tags', '<cmd>Telescope help_tags<CR>'),
	dashboard.button('c', '   Config', '<cmd>Telescope find_files cwd=' .. vim.fn.stdpath('config') .. '<CR>'),
	dashboard.button('l', '   LSP Info', '<cmd>LspInfo<CR>'),
	dashboard.button('m', '   Lazy Loading', '<cmd>Lazy<CR>'),
	dashboard.button('t', '   Restore Session', '<cmd>source ~/.config/nvim/session.vim<CR>'),
	dashboard.button('q', '   Quit Neovim', '<cmd>qa<CR>'),
}

local footer_val = {
	'',
	'─────────────────────────────────────────────',
	'NotMinimal | Neovim ' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch,
	'https://github.com/Not-Minimal/notdot',
	'─────────────────────────────────────────────',
}

dashboard.section.buttons.val = buttons
dashboard.section.footer.val = footer_val
dashboard.section.footer.opts.hl = 'Comment'

-- Set highlight groups
dashboard.section.header.opts.hl = 'Statement'

-- Configure padding
dashboard.config.opts.noautocmd = true

-- Setup alpha
alpha.setup(dashboard.opts)

-- Disable statusline when showing dashboard
vim.cmd([[autocmd FileType alpha setlocal laststatus=0 | autocmd BufLeave <buffer> setlocal laststatus=3]])
