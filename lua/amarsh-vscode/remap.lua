
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>D", [["_D]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
-- 
-- vim.api.nvim_create_augroup('open_qf', {
--     clear = true
-- })
-- vim.api.nvim_create_autocmd({"FileType"}, {
--     group = "open_qf",
--     pattern = "qf",
--     callback = function()
--         vim.schedule(function ()
--             vim.keymap.set("n", "dd", function()
--                 local lineNumber = vim.fn.line('.')
--                 local qfall = vim.fn.getqflist()
--                 table.remove(qfall, lineNumber)
--                 vim.fn.setqflist(qfall, 'r')
--                 vim.cmd("copen")
--                 vim.api.nvim_win_set_cursor(0, {lineNumber, 0})
--             end, {buffer = true})
--             vim.keymap.set("v", "d", function()
--                 local startLineNumber = math.min(vim.fn.line('v'), vim.fn.line('.'))
--                 local endLineNumber = math.max(vim.fn.line('v'), vim.fn.line('.'))
--                 local qfall = vim.fn.getqflist()
--                 for i = endLineNumber, startLineNumber, -1
--                 do
--                     table.remove(qfall, i)
--                 end
--                 vim.fn.setqflist(qfall, 'r')
--                 vim.cmd("copen")
--                 vim.api.nvim_win_set_cursor(0, {startLineNumber, 0})
--             end, {buffer = true})
--         end)
--     end,
-- })
--
-- -- vscode specific
-- -- removes highlighting after escaping vim search
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
-- keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap("n", "K", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({"n", "v"}, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
-- keymap({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
-- keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({"n", "v"}, "<leader>fs", "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>")
-- keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
-- keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({"n", "v"}, "<leader>f", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({"n", "v"}, "<leader>pv", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
-- keymap('n', '<Leader>tp', "<cmd>lua require('vscode').action('workbench.action.togglePanel')<CR>", { silent = true })
