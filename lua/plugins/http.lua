return {
    {
        "mistweaverco/kulala.nvim",
        keys = {
            { "<leader>rr", desc = "Send request" },
            { "<leader>RR", desc = "Send all requests" },
            { "<leader>rb", desc = "Open scratchpad" },
            { "<leader>rl", desc = "Replay the last request" },
        },
        ft = { "http", "rest" },
        opts = {
            -- your configuration comes here
            global_keymaps = false,
            global_keymaps_prefix = "<leader>r",
            kulala_keymaps_prefix = "",
        },
        config = function(_, opts)
            local kulala = require("kulala")
            kulala.setup(opts)
            vim.keymap.set('n', '<leader>rr', kulala.run)
        end,
    },
}
