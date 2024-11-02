return {
--    {
--        "catppuccin/nvim",
--        name = "catppuccin",
--        priority = 1000,
--        lazy = false,
--        config = function()
--            --        vim.cmd.colorscheme "catppuccin-mocha"
--        end
--    },
    --{
    --    "folke/tokyonight.nvim",
    --    lazy = false,
    --    priority = 1000,
    --    config = function()
    --        vim.cmd[[colorscheme tokyonight]]
    --    end
    --}
    {
        "tanvirtin/monokai.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme monokai]]
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    }
}
