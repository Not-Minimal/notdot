return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 5000,
        top_down = true,
      })
      vim.notify = require("notify")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = true,
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
              },
            },
            view = "mini",
          },
        },
      })
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          default_prompt = "➤ ",
          prompt_align = "left",
          insert_only = true,
          start_in_insert = true,
          border = "rounded",
          relative = "cursor",
          prefer_width = 40,
          width = nil,
          max_width = { 140, 0.9 },
          min_width = { 20, 0.2 },
          buf_options = {},
          win_options = {
            winblend = 10,
          },
          get_config = nil,
        },
        select = {
          enabled = true,
          backend = { "telescope", "fzf", "builtin" },
          trim_prompt = true,
          telescope = nil,
          fzf = {
            window = {
              yoffset = -0.5,
            },
          },
          nui = {
            position = "50%",
            size = nil,
            border = {
              style = "rounded",
            },
            buf_options = {
              swapfile = false,
              filetype = "DressingSelect",
            },
            win_options = {
              winblend = 10,
            },
            max_width = 80,
            max_height = 40,
            min_width = 40,
            min_height = 10,
          },
          builtin = {
            border = "rounded",
            relative = "editor",
            buf_options = {},
            win_options = {
              cursorline = true,
              cursorlineopt = "both",
            },
            width = nil,
            height = nil,
            min_width = 40,
            max_width = nil,
            min_height = 10,
            max_height = nil,
          },
          format_item_override = {},
          get_config = nil,
        },
      })
    end,
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      -- Mini AI - Extending text objects
      require("mini.ai").setup()

      -- Mini Indentscope - Visual indentation guide
      require("mini.indentscope").setup({
        symbol = "│",
        options = {
          try_as_border = true,
        },
      })

      -- Mini Surround - Surroundings manipulation
      require("mini.surround").setup({
        mappings = {
          add = "sa",
          delete = "sd",
          find = "sf",
          find_left = "sF",
          highlight = "sh",
          replace = "sr",
          update_n_lines = "sn",
        },
      })

      -- Mini Starter - Starting screen
      require("mini.starter").setup()

      -- Mini Statusline - Minimal statusline
      require("mini.statusline").setup()
    end,
  },
}
