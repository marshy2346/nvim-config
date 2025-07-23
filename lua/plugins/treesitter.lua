return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "css",
                    "dockerfile",
                    "gdscript",
                    "gdshader",
                    "glsl",
                    "godot_resource",
                    "graphql",
                    "html",
                    "http",
                    "java",
                    "javascript",
                    "json",
                    "kotlin",
                    "lua",
                    "php",
                    "python",
                    "query",
                    "sql",
                    "terraform",
                    "vim",
                    "vimdoc",
                    "xml",
                    "yaml",
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
