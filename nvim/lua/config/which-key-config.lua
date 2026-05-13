require("which-key").setup({
  preset = "modern",
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,
  spec = {
    -- Window Navigation / Splitting (No prefix group, just direct keys if needed, but we document standard things here)
    {
      mode = { "n", "v" },
      { "<leader>f", group = "File / Find" },
      { "<leader>s", group = "Search"},
      { "<leader>g", group = "Git" },

      -- LSP Groups
      { "<leader>c", group = "Code (LSP)" },
      { "<leader>ca", group = "LSP Actions" },
      { "<leader>cc", group = "LSP Calls" },
      { "<leader>cd", group = "LSP Diagnostics" },
      { "<leader>ch", group = "LSP Help" },
      { "<leader>ci", group = "LSP Imports" },
      { "<leader>cn", group = "LSP Navigation" },
      { "<leader>cr", group = "LSP Refactor" },
      { "<leader>cs", group = "LSP Symbols/Outline" },

      -- Explicitly document nvim-tree global toggle
      { "<leader>e", desc = "Toggle File Explorer" },
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  win = {
    border = "rounded",
  },
})
