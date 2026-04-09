return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- Keymaps
      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { noremap = true, silent = true, desc = "Add harpoon mark" })
      vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { noremap = true, silent = true, desc = "Harpoon menu" })
      
      -- Quick navigation to marks 1-4
      for i = 1, 4 do
        vim.keymap.set("n", "<leader>h" .. i, function() harpoon:list():select(i) end, { noremap = true, silent = true, desc = "Harpoon file " .. i })
      end
    end,
  },
  {
    "tpope/vim-sleuth",
    lazy = false,
  },
  {
    "mbbill/undotree",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle undotree" })
    end,
  },
  {
    "szw/vim-maximizer",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>zm", ":MaximizerToggle<CR>", { noremap = true, silent = true, desc = "Toggle maximize window" })
    end,
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      require("smart-splits").setup({
        ignored_filetypes = {
          "nofile",
          "quickfix",
          "qf",
          "prompt",
        },
        ignored_buftypes = { "nofile" },
        default_amount = 3,
        at_edge = "stop",
        move_cursor_same_row = false,
        cursor_follows_swapped_bufs = false,
        log_level = "info",
      })

      -- Keymaps
      local splits = require("smart-splits")
      
      -- Resize with Alt + arrow keys
      vim.keymap.set("n", "<A-h>", splits.resize_left, { noremap = true, silent = true })
      vim.keymap.set("n", "<A-j>", splits.resize_down, { noremap = true, silent = true })
      vim.keymap.set("n", "<A-k>", splits.resize_up, { noremap = true, silent = true })
      vim.keymap.set("n", "<A-l>", splits.resize_right, { noremap = true, silent = true })

      -- Move cursor with Ctrl + arrow keys
      vim.keymap.set("n", "<C-h>", splits.move_cursor_left, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-j>", splits.move_cursor_down, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-k>", splits.move_cursor_up, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-l>", splits.move_cursor_right, { noremap = true, silent = true })

      -- Swap bufs with Ctrl + Alt + arrow keys
      vim.keymap.set("n", "<C-A-h>", splits.swap_buf_left, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-A-j>", splits.swap_buf_down, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-A-k>", splits.swap_buf_up, { noremap = true, silent = true })
      vim.keymap.set("n", "<C-A-l>", splits.swap_buf_right, { noremap = true, silent = true })
    end,
  },
}
