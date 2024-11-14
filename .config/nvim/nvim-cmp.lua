local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- LuaSnip integration
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },           -- Source for LSP autocompletion
        { name = 'luasnip' },            -- Source for snippets
    }, {
        { name = 'buffer' },             -- Source for buffer words
        { name = 'path' },               -- Source for file paths
    })
})

