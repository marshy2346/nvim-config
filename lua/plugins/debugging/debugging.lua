return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',
        'Weissle/persistent-breakpoints.nvim',
        'jonathan-elize/dap-info.nvim',
    },
    config = function()
        require('dap-info').setup({})
        local dap = require('dap')
        local dapui = require('dapui')
        local persist = require('persistent-breakpoints')
        local persistapi = require('persistent-breakpoints.api')
        local info = require("dap-info.breakpoint-info-utils")
        persist.setup{
            load_breakpoints_event = { "BufReadPost" }
        }

        require('mason-nvim-dap').setup({
            ensure_installed = { "python", "node2" },
        })

        dap.configurations.gdscript = {
            {
                type = 'godot',
                request = 'launch',
                name = 'Launch scene',
                program = '${workspaceFolder}',
                launch_scene = true,
            },
        }

        dap.configurations.javascript = {
            {
                type = 'javascript',
                request = 'launch',
                name = 'Launch',
                program = '${file}',
            }
        }


        local windowOpts = {
            height = 2,
            width = 80,
        }
        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set('n', '<leader>C', dap.continue, { desc = 'Debug: Start/Continue' })
        vim.keymap.set('n', '<C-A>', dap.step_into, { desc = 'Debug: Step Into' })
        vim.keymap.set('n', '<C-S>', dap.step_over, { desc = 'Debug: Step Over' })
        --vim.keymap.set('n', '<C-Q>', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set('n', '<leader>b', persistapi.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader>B', persistapi.set_conditional_breakpoint, { desc = 'Debug: Set Breakpoint' })
        vim.keymap.set('n', '<leader>Bg', info.show_breakpoint_info_on_current_line)

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        -- vim.keymap.set('n', '<C-D><C-T>', dapui.toggle, { desc = 'Debug: See last session result.' })

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end
}
