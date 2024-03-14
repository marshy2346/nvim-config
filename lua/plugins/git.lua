return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', '<leader>gs', ':Git status<CR>')
            vim.keymap.set('n', '<leader>gp', ':Git pull<CR>')
            vim.keymap.set('n', '<leader>gP', ':Git push<CR>')
            vim.keymap.set('n', '<leader>ga', ':Git add ' .. vim.fn.expand('%:p') .. '<CR>')
            vim.keymap.set('n', '<leader>gA', ':Git add .<CR>')
            vim.keymap.set('n', '<leader>gc', function()
                local commit_message = vim.fn.input("Commit message: ")
                vim.cmd(':Git commit -m "' .. commit_message .. '"')
            end)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require('gitsigns')
            gitsigns.setup()

            vim.keymap.set('n', '<leader>ph', gitsigns.preview_hunk_inline)
        end
    }
}
