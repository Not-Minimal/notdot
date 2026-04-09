return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("flash").setup({
        labels = "abcdefghijklmnopqrstuvwxyz",
        search = {
          multi_window = true,
          forward = true,
          wrap = false,
          incremental = false,
        },
        jump = {
          autojump = false,
        },
        label = {
          uppercase = false,
          before = true,
          after = false,
          reuse = "uppercase",
          distance = nil,
          min_pattern_length = 0,
          exclude = "",
          current = false,
          fluid = false,
        },
        highlight = {
          backdrop = true,
          matches = true,
          priority = 5000,
        },
        action = nil,
        pattern = "",
        state = {},
      })

      vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { noremap = true, silent = true, desc = "Flash" })
      vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { noremap = true, silent = true, desc = "Flash Treesitter" })
      vim.keymap.set("o", "r", function() require("flash").remote() end, { noremap = true, silent = true, desc = "Flash Remote" })
      vim.keymap.set({ "x", "o" }, "R", function() require("flash").treesitter_search() end, { noremap = true, silent = true, desc = "Flash Treesitter Search" })
      vim.keymap.set("c", "<C-s>", function() require("flash").toggle() end, { noremap = true, silent = true, desc = "Toggle Flash Search" })
    end,
  },
  {
    "chentoast/marks.nvim",
    lazy = false,
    config = function()
      require("marks").setup({
        default_mappings = true,
        builtin_marks = { ".", "<", ">", "^" },
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 250,
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        excluded_filetypes = {},
        excluded_buftypes = {},
        bookmark_0 = {
          sign = "⚑",
          virt_text = "bookmark 0",
          annotate = false,
        },
        mappings = {},
      })
    end,
  },
  {
    "stevearc/aerial.nvim",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup({
        layout = {
          max_width = { 40, 0.2 },
          width = 30,
          min_width = 10,
          win_opts = {},
          default_direction = "prefer_right",
          placement = "window",
          preserve_equality = false,
        },
        attach_mode = "window",
        on_attach = nil,
        on_detach = nil,
        keymaps = {
          ["?"] = "actions.show_help",
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.jump",
          ["{"] = "actions.prev",
          ["}"] = "actions.next",
          ["[["] = "actions.prev_up",
          ["]]"] = "actions.next_up",
          ["q"] = "actions.close",
          ["o"] = "actions.tree_toggle",
          ["*"] = "actions.tree_toggle_recursive",
          ["j"] = "actions.down_and_scroll",
          ["k"] = "actions.up_and_scroll",
        },
        lazy_load = true,
        filter_kind = {
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Module",
          "Method",
          "Struct",
        },
        highlight_on_hover = false,
        highlight_on_jump = 300,
        ignore = {
          unlisted = true,
          unhidden = false,
          diff = true,
          help = true,
          man = true,
          buffer = false,
        },
        link_tree_to_folds = true,
        link_folds_to_tree = false,
        manage_folds = false,
        post_jump_cmd = "normal! zz",
        close_automatic_events = {},
        open_automatic_events = {},
        autojump = false,
        post_open_cmd = nil,
      })

      vim.keymap.set("n", "<leader>la", ":AerialToggle!<CR>", { noremap = true, silent = true, desc = "Aerial toggle" })
    end,
  },
}
