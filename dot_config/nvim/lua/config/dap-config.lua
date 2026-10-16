-- DAP Configuration (debugger)
-- nvim-dap + nvim-dap-ui, with Go support through delve (nvim-dap-go)

local dap = require("dap")
local dapui = require("dapui")

require("dap-go").setup()
dapui.setup()

-- Open the UI when a session starts and close it when it ends
dap.listeners.after.event_initialized["dapui"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui"] = function()
	dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" })

local map = vim.keymap.set

map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Condition: "))
end, { desc = "Conditional breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "Start / continue" })
map("n", "<leader>dn", dap.step_over, { desc = "Step over (next)" })
map("n", "<leader>di", dap.step_into, { desc = "Step into" })
map("n", "<leader>do", dap.step_out, { desc = "Step out" })
map("n", "<leader>dl", dap.run_last, { desc = "Run last" })
map("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
map("n", "<leader>dq", dap.terminate, { desc = "Terminate" })
map("n", "<leader>du", dapui.toggle, { desc = "Toggle debug UI" })
map({ "n", "x" }, "<leader>de", dapui.eval, { desc = "Evaluate expression" })
map("n", "<leader>dt", require("dap-go").debug_test, { desc = "Debug Go test under cursor" })
