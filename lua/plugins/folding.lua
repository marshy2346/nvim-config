return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        config = function()
            local ufo = require('ufo')
            ufo.setup({
                provider_selector = function()
                    return { 'lsp', 'indent' }
                end
            })
        end
    }
}
