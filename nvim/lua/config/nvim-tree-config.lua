-- Optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent,        opts("Up"))
  vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
    -- AGREGADO: Evita que nvim-tree procese carpetas pesadas
    custom = { "^.git$", "^node_modules$", "^.cache$" },
  },
  -- AGREGADO: Configuración del vigilante de archivos
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {
      "node_modules",
      "build",
      "dist",
      "target",
      ".git",
    },
  },
})

-- Keymap to toggle NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle File Explorer" })
