return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "python",
                    "javascript",
                    "html",
                    "css",
                    "sql",
                    "gdscript",
                    "godot_resource",
                    "gdshader",
                    "yaml",
                    "dockerfile",
                    "zig"
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true }
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "tanvirtin/monokai.nvim"
        },
        config = function()
            require('treesitter-context').setup {
                enable = true,
                max_lines = 0,
                line_numbers = true,
                mode = 'topline'
            }

            local theme = require("monokai").classic

            vim.cmd("hi TreeSitterContext guibg=" .. theme.base4)
        end
    }
}
