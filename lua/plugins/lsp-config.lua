local lsp_config = {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                PATH = "prepend",
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'williamboman/mason.nvim',
            "williamboman/mason-lspconfig.nvim",
            'folke/neodev.nvim',
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "cssls",
                    "eslint",
                    "html",
                    "intelephense", --PHP
                    "jdtls",
                    "lua_ls",
                    "pylsp",
                    "pyright",
                    "terraformls",
                    "ts_ls",
                    "yamlls",
                    "zls",
                }
            })
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        }
                    }
                },
                capabilities = capabilities
            })

            lspconfig.pyright.setup({
                -- before_init = function (_, config)
                --     local pythonPath = require('amarsh.utils').get_python_path(config.root_dir)
                --     config.settings.python.pythonPath = pythonPath
                -- end,
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true,
                    }
                },
                capabilities = capabilities
            })
            -- lspconfig.pylsp.setup({
            --     -- before_init = function (_, config)
            --     --     local pythonPath = require('amarsh.utils').get_python_path()
            --     --     config.settings.python.pythonPath = pythonPath
            --     --     print(pythonPath)
            --     --     print('test')
            --     -- end,
            --     settings = {
            --         pylsp = {
            --             plugins = {
            --                 pycodestyle = {
            --                     maxLineLength = 120
            --                 },
            --                 pylint = {
            --                     enabled = true
            --                 }
            --             }
            --         }
            --     },
            --     capabilities = capabilities,
            -- })

            -- lspconfig.jdtls.setup({
            --     capabilities = capabilities,
            -- })

            lspconfig.zls.setup({
                capabilities = capabilities,
            })

            lspconfig.intelephense.setup({
                capabilities = capabilities,
                settings = {
                    intelephense = {
                        stubs = {
                            "wordpress",
                            "acf-pro",
                        },
                        environment = {
                            includePaths = vim.fn.expand("~/.composer/vender/php-stubs/"),
                        }
                    }
                }
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
            })

            lspconfig.gdscript.setup({
                capabilities = capabilities,
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.eslint.setup({
                capabilities = capabilities,
            })

            lspconfig.html.setup({
                capabilities = capabilities,
            })

            lspconfig.cssls.setup({
                capabilities = capabilities,
            })

            lspconfig.terraformls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
            -- vim.keymap.set('n', '<leader>e', function()
            --     vim.diagnostic.config({virtual_lines = {current_line = true}, virtual_text = false})
            --     vim.api.nvim_create_autocmd('CursorMoved', { group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
            --         callback = function()
            --             vim.diagnostic.config({virtual_lines = false, virtual_text = true})
            --             return true
            --         end,
            --     })
            -- end)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    }
}
if vim.fn.has('win32') == 1 then
    table.insert(lsp_config, {
        "seblj/roslyn.nvim",
        ft = "cs",
        opts = {
            -- your configuration comes here; leave empty for default settings
        }
    })
end

return lsp_config
