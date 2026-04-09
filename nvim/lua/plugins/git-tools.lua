return {
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "LazyGit" })
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup()
      vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { noremap = true, silent = true, desc = "Diffview open" })
      vim.keymap.set("n", "<leader>gD", ":DiffviewClose<CR>", { noremap = true, silent = true, desc = "Diffview close" })
    end,
  },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({
        disable_signs = false,
        disable_hint = false,
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        auto_refresh = true,
        disable_builtin_keymaps = false,
        commit_popup = {
          kind = "split",
        },
        popup = {
          kind = "split",
        },
        integrations = {
          diffview = true,
          telescope = true,
        },
      })
      vim.keymap.set("n", "<leader>gn", ":Neogit<CR>", { noremap = true, silent = true, desc = "Neogit" })
    end,
  },
}
