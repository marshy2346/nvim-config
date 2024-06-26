return {
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                enable_chat = true
            })
        end
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        }
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            require("luasnip.loaders.from_vscode").lazy_load()

            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                }),
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' }, -- For luasnip users.
                        { name = 'codeium' }, -- For codeium users.
                    },
                    {
                        { name = 'buffer' },
                        { name = 'path' },
                    })
            })
        end
    }
}
