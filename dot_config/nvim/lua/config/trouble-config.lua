-- Trouble Configuration
-- Pretty list for diagnostics, references, quickfix and location lists

require("trouble").setup({
	focus = true,
})

local map = vim.keymap.set

map("n", "<leader>xx", "<Cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (workspace)" })
map("n", "<leader>xb", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (buffer)" })
map("n", "<leader>xs", "<Cmd>Trouble symbols toggle<CR>", { desc = "Symbols" })
map("n", "<leader>xr", "<Cmd>Trouble lsp toggle win.position=right<CR>", { desc = "LSP definitions/references" })
map("n", "<leader>xq", "<Cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })
map("n", "<leader>xl", "<Cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
