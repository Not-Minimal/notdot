return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "html",
          "cssls",
          "jsonls",
          "rust_analyzer",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "mason-lspconfig.nvim", "cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local navbuddy = require("nvim-navbuddy")

      local on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
      end

      -- Setup language servers using vim.lsp.config (Neovim 0.11+)
      vim.lsp.config("lua_ls", {
        name = "lua_ls",
        cmd = { "lua-language-server" },
        root_markers = { ".luarc.json", ".luarc.jsonc", "selene.toml", "stylua.toml" },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
        on_attach = on_attach,
      })

      vim.lsp.config("pyright", {
        name = "pyright",
        cmd = { "pyright-langserver", "--stdio" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "pyrightconfig.json" },
        on_attach = on_attach,
      })

      vim.lsp.config("ts_ls", {
        name = "ts_ls",
        cmd = { "typescript-language-server", "--stdio" },
        root_markers = { "tsconfig.json", "jsconfig.json", "package.json" },
        on_attach = on_attach,
      })

      vim.lsp.config("html", {
        name = "html",
        cmd = { "html-languageserver", "--stdio" },
        root_markers = { ".html-validate.json", "package.json" },
        on_attach = on_attach,
      })

      vim.lsp.config("cssls", {
        name = "cssls",
        cmd = { "css-languageserver", "--stdio" },
        root_markers = { "package.json" },
        on_attach = on_attach,
      })

      vim.lsp.config("jsonls", {
        name = "jsonls",
        cmd = { "json-languageserver", "--stdio" },
        root_markers = { "package.json" },
        on_attach = on_attach,
      })

      vim.lsp.config("rust_analyzer", {
        name = "rust_analyzer",
        cmd = { "rust-analyzer" },
        root_markers = { "Cargo.toml" },
        settings = {
          ["rust-analyzer"] = {
            diagnostics = { enable = true },
          },
        },
        on_attach = on_attach,
      })

      -- Auto-enable LSP for recognized filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local config = vim.lsp.config[vim.bo[args.buf].filetype]
          if config then
            vim.lsp.enable(config.name)
          end
        end,
      })

      -- Global LSP mappings
      local map = vim.keymap.set
      map("n", "<leader>lD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
      map("n", "<leader>ld", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
      map("n", "<leader>lh", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover" })
      map("n", "<leader>li", vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Go to implementation" })
      map("n", "<leader>ls", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "Signature help" })
      map("n", "<leader>lr", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename" })
      map("n", "<leader>la", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action" })
      map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true, desc = "Format" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for `:` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}
