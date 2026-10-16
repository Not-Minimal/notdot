-- Neotest Configuration (test runner)
-- Go tests through neotest-golang, using gotestsum (installed by Mason)

local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-golang")({
			runner = "gotestsum",
		}),
	},
})

local map = vim.keymap.set

map("n", "<leader>tt", function()
	neotest.run.run()
end, { desc = "Run nearest test" })
map("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end, { desc = "Run file tests" })
map("n", "<leader>ta", function()
	neotest.run.run(vim.uv.cwd())
end, { desc = "Run all tests" })
map("n", "<leader>tl", function()
	neotest.run.run_last()
end, { desc = "Run last test" })
map("n", "<leader>td", function()
	neotest.run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })
map("n", "<leader>tS", function()
	neotest.run.stop()
end, { desc = "Stop" })
map("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { desc = "Toggle summary" })
map("n", "<leader>to", function()
	neotest.output.open({ enter = true, auto_close = true })
end, { desc = "Show output" })
map("n", "<leader>tO", function()
	neotest.output_panel.toggle()
end, { desc = "Toggle output panel" })
