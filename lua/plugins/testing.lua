return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "Issafalcon/neotest-dotnet",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function ()
            require("neotest").setup({
                adapters = {
                    require("neotest-dotnet")({
                        dap = { justMyCode = false },
                        discover_root = "solution"
                    })
                }
            })


            --vim.keymap.set('n', '<leader>rt', ":lua require(\"neotest\").run.run()<CR>")
            vim.keymap.set('n', '<leader>rt', function ()
               require("neotest").run.run()
            end)
        end
    },
}
