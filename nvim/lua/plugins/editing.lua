return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        mode = "cursor",
        separator = nil,
        zindex = 20,
        on_attach = nil,
      })
      vim.keymap.set("n", "[c", function() require("treesitter-context").go_to_context(vim.v.count1) end, { noremap = true, silent = true, desc = "Go to context" })
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)", { noremap = false, silent = true })
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)", { noremap = false, silent = true })
      vim.keymap.set({ "x", "o" }, "x", "<Plug>(leap-forward-till)", { noremap = false, silent = true })
      vim.keymap.set({ "x", "o" }, "X", "<Plug>(leap-backward-till)", { noremap = false, silent = true })
    end,
  },
  {
    "monaqa/dial.nvim",
    lazy = false,
    config = function()
      local dial = require("dial.config")
      local augend = require("dial.augend")

      dial.augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.constant.alias.bool,
          augend.date.alias["%Y-%m-%d"],
          augend.semver.alias.semver,
          augend.constant.new { elements = { "and", "or" } },
          augend.constant.new { elements = { "&&", "||" }, word = false },
          augend.constant.new { elements = { "true", "false" } },
          augend.constant.new { elements = { "yes", "no" } },
          augend.constant.new { elements = { "on", "off" } },
        },
      })

      vim.keymap.set("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, { noremap = true, silent = true, desc = "Increment" })
      vim.keymap.set("n", "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, { noremap = true, silent = true, desc = "Decrement" })
      vim.keymap.set("v", "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, { noremap = true, silent = true, desc = "Increment" })
      vim.keymap.set("v", "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, { noremap = true, silent = true, desc = "Decrement" })
    end,
  },
}
