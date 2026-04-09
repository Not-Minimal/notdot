return {
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "tpope/vim-commentary",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true, desc = "Git status" })
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true, desc = "Git commit" })
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true, desc = "Git push" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "▎" },
          topdelete = { text = "▎" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          enable = true,
          interval = 1000,
        },
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    lazy = false,
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        signs = true,
        sign_priority = 8,
        keywords = {
          FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },
      })
      vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { noremap = true, silent = true, desc = "Todo list" })
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      require("which-key").setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        icons = {
          breadcrumb = "»",
          separator = "➜",
          group = "+",
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        position = "bottom",
        height = 10,
        width = 50,
        icons = true,
        mode = "document_diagnostics",
        fold_open = "v",
        fold_closed = ">",
        group = true,
        padding = true,
        action_keys = {
          close = "q",
          cancel = "<esc>",
          refresh = "r",
          jump = { "<cr>", "<tab>" },
          open_split = { "<c-x>" },
          open_vsplit = { "<c-v>" },
          open_tab = { "<c-t>" },
          jump_close = { "o" },
          toggle_mode = "m",
          toggle_preview = "P",
          hover = "K",
          preview = "p",
          close_folds = { "zM", "zm" },
          open_folds = { "zR", "zr" },
          toggle_fold = { "zA", "za" },
          previous = "k",
          next = "j",
        },
        multiline = true,
        severity = nil,
      })
      vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", { noremap = true, silent = true, desc = "Toggle trouble" })
      vim.keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", { noremap = true, silent = true, desc = "Workspace diagnostics" })
      vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", { noremap = true, silent = true, desc = "Document diagnostics" })
      vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<CR>", { noremap = true, silent = true, desc = "Quickfix" })
      vim.keymap.set("n", "<leader>xl", ":TroubleToggle loclist<CR>", { noremap = true, silent = true, desc = "Location list" })
    end,
  },
}
