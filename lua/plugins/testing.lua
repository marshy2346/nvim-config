return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-jest",
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function ()
            require("neotest").setup({
                adapters = {
                    require("neotest-jest")({
                        jestCommand = "npm test --",
                        jestConfigFile = "jest.config.js",
                    })
                }
            })


            --vim.keymap.set('n', '<leader>rt', ":lua require(\"neotest\").run.run()<CR>")
            vim.keymap.set('n', '<leader>tr', function ()
                require("neotest").run.run()
            end)
            vim.keymap.set('n', '<leader>td', function ()
                require("neotest").run.run({strategy = "dap"})
            end)
        end
    },
}
