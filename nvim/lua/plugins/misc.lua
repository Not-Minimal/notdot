return {
  {
    "folke/persistence.nvim",
    lazy = false,
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },
        pre_save = nil,
        save_empty = false,
        should_autosave = function()
          return vim.bo.buftype == ""
        end,
      })

      vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { noremap = true, silent = true, desc = "Restore session" })
      vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { noremap = true, silent = true, desc = "Restore last session" })
      vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { noremap = true, silent = true, desc = "Don't save session" })
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = { "icon" },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        default_file_explorer = true,
        restore_win_options = true,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = true,
        view_options = {
          show_hidden = false,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          is_always_hidden = function(name, bufnr)
            return name == ".." or name == "."
          end,
          natural_order = "fast",
          case_sensitive = false,
          sort = {
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        extra_scp_args = {},
        git = {
          add = function(path)
            return false
          end,
          mv = function(src_path, dest_path)
            return false
          end,
          rm = function(path)
            return false
          end,
        },
        max_notify_duration = 3000,
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true, desc = "Open oil" })
      vim.keymap.set("n", "<leader>-", require("oil").open_float, { noremap = true, silent = true, desc = "Open oil float" })
    end,
  },
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          yaml = { "prettier" },
          rust = { "rustfmt" },
          go = { "gofmt", "goimports" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        log_level = vim.log.levels.ERROR,
        notify_on_error = true,
      })

      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end, { noremap = true, silent = true, desc = "Format" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    lazy = false,
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        python = { "pylint", "flake8" },
        javascript = { "eslint" },
        typescript = { "eslint" },
        lua = { "luacheck" },
        rust = { "clippy" },
        go = { "golangci-lint" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>cl", function() require("lint").try_lint() end, { noremap = true, silent = true, desc = "Lint" })
    end,
  },
}
