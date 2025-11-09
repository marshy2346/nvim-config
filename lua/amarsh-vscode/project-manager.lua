local keymap = vim.keymap.set
keymap({"n", "v"}, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({"n", "v"}, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({"n", "v"}, "<leader>pO", "<cmd>lua require('vscode').action('projectManager.listProjects')<CR>")
keymap({"n", "v"}, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
