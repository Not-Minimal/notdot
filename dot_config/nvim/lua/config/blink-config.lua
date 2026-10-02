require("blink.cmp").setup({
    -- Configuramos las teclas para que se sientan naturales
    keymap = {
        preset = 'none', -- Desactivamos el preset para evitar conflictos
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
    },

    appearance = {
        nerd_font_variant = 'mono'
    },

    completion = {
        -- 1. PARÉNTESIS AUTOMÁTICOS
        accept = {
            auto_brackets = { enabled = true },
        },
        -- 2. PRESELECCIÓN (Esto hace que la primera sugerencia esté marcada)
        list = {
            selection = {
                preselect = true,
                auto_insert = true
            }
        },
        documentation = { auto_show = true },
        ghost_text = { enabled = true }, -- Opcional: te muestra el texto tenue
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust" }
})
