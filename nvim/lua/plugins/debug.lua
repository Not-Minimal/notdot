return {
  {
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-go",
      "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
          require("neotest-jest"),
          require("neotest-go"),
          require("neotest-rust"),
        },
      })

      vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { noremap = true, silent = true, desc = "Test nearest" })
      vim.keymap.set("n", "<leader>tT", function() require("neotest").run.run(vim.fn.expand("%")) end, { noremap = true, silent = true, desc = "Test file" })
      vim.keymap.set("n", "<leader>ta", function() require("neotest").run.run({ suite = true }) end, { noremap = true, silent = true, desc = "Test all" })
      vim.keymap.set("n", "<leader>tl", function() require("neotest").run.run_last() end, { noremap = true, silent = true, desc = "Test last" })
      vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { noremap = true, silent = true, desc = "Test summary" })
      vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, { noremap = true, silent = true, desc = "Test output" })
      vim.keymap.set("n", "<leader>tS", function() require("neotest").stop() end, { noremap = true, silent = true, desc = "Test stop" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")

      -- Python
      require("dap-python").setup()

      -- Go
      require("dap-go").setup()

      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { noremap = true, silent = true, desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { noremap = true, silent = true, desc = "Set breakpoint condition" })
      vim.keymap.set("n", "<leader>dc", dap.continue, { noremap = true, silent = true, desc = "Continue" })
      vim.keymap.set("n", "<leader>dC", dap.clear_breakpoints, { noremap = true, silent = true, desc = "Clear breakpoints" })
      vim.keymap.set("n", "<leader>ds", dap.step_over, { noremap = true, silent = true, desc = "Step over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { noremap = true, silent = true, desc = "Step into" })
      vim.keymap.set("n", "<leader>do", dap.step_out, { noremap = true, silent = true, desc = "Step out" })
      vim.keymap.set("n", "<leader>dn", dap.step_back, { noremap = true, silent = true, desc = "Step back" })
      vim.keymap.set("n", "<leader>dd", dap.terminate, { noremap = true, silent = true, desc = "Terminate" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { noremap = true, silent = true, desc = "Open REPL" })
      vim.keymap.set("n", "<leader>de", dap.set_exception_breakpoints, { noremap = true, silent = true, desc = "Set exception breakpoint" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dapui = require("dapui")
      dapui.setup({
        icons = { expanded = "", collapsed = "", current_frame = "" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        element_mappings = {},
        expand_lines = true,
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.17 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
        controls = {
          enabled = true,
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            disconnect = "",
            terminate = "",
          },
        },
        floating = {
          max_height = nil,
          max_width = nil,
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil,
          max_value_length = nil,
        },
      })

      local dap = require("dap")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "<leader>du", dapui.toggle, { noremap = true, silent = true, desc = "Toggle DAP UI" })
    end,
  },
}
