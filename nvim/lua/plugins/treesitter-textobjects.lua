return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts
      vim.g.no_plugin_maps = true
    end,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
          },
          include_surrounding_whitespace = false,
        },
        move = {
          enable = true,
          set_jumps = true,
        },
        swap = {
          enable = true,
        },
      })

      -- Text object keymaps
      local function select_textobject(capture, query_group)
        return function()
          require("nvim-treesitter-textobjects.select").select_textobject(capture, query_group)
        end
      end

      -- Function mappings
      vim.keymap.set({ "x", "o" }, "am", select_textobject("@function.outer", "textobjects"), { noremap = true, silent = true, desc = "Outer function" })
      vim.keymap.set({ "x", "o" }, "im", select_textobject("@function.inner", "textobjects"), { noremap = true, silent = true, desc = "Inner function" })

      -- Class mappings
      vim.keymap.set({ "x", "o" }, "ac", select_textobject("@class.outer", "textobjects"), { noremap = true, silent = true, desc = "Outer class" })
      vim.keymap.set({ "x", "o" }, "ic", select_textobject("@class.inner", "textobjects"), { noremap = true, silent = true, desc = "Inner class" })

      -- Parameter mappings
      vim.keymap.set({ "x", "o" }, "a,", select_textobject("@parameter.outer", "textobjects"), { noremap = true, silent = true, desc = "Outer parameter" })
      vim.keymap.set({ "x", "o" }, "i,", select_textobject("@parameter.inner", "textobjects"), { noremap = true, silent = true, desc = "Inner parameter" })

      -- Swap keymaps
      vim.keymap.set("n", "<leader>ts", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
      end, { noremap = true, silent = true, desc = "Swap parameter next" })

      vim.keymap.set("n", "<leader>tS", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
      end, { noremap = true, silent = true, desc = "Swap parameter previous" })

      -- Move keymaps
      vim.keymap.set({ "n", "x", "o" }, "]m", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end, { noremap = true, silent = true, desc = "Next function start" })

      vim.keymap.set({ "n", "x", "o" }, "]M", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
      end, { noremap = true, silent = true, desc = "Next function end" })

      vim.keymap.set({ "n", "x", "o" }, "[m", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end, { noremap = true, silent = true, desc = "Previous function start" })

      vim.keymap.set({ "n", "x", "o" }, "[M", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
      end, { noremap = true, silent = true, desc = "Previous function end" })

      vim.keymap.set({ "n", "x", "o" }, "]]", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
      end, { noremap = true, silent = true, desc = "Next class start" })

      vim.keymap.set({ "n", "x", "o" }, "][", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end, { noremap = true, silent = true, desc = "Next class end" })

      vim.keymap.set({ "n", "x", "o" }, "[[", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
      end, { noremap = true, silent = true, desc = "Previous class start" })

      vim.keymap.set({ "n", "x", "o" }, "[]", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
      end, { noremap = true, silent = true, desc = "Previous class end" })

      -- Repeatable move keymaps
      local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

      -- Repeat movement with ; and ,
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next, { noremap = true, silent = true })
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous, { noremap = true, silent = true })

      -- Make builtin f, F, t, T repeatable
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true, noremap = true })
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true, noremap = true })
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true, noremap = true })
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true, noremap = true })
    end,
  },
}
