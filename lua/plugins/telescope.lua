return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        telescope.setup({
            defaults = {
                path_display = {
                    "truncate",
                }
            },
            mappings = {
                i = {
                    ["<C-q>"] = actions.send_to_qflist
                },
                n = {
                    ["q"] = actions.send_to_qflist
                }
            }
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
    end
}
