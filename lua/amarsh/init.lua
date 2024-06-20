require("amarsh.set")
require("amarsh.remap")

require("amarsh.lazy")
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

local projectfile = vim.fn.getcwd() .. "/project.godot"
if vim.fn.filereadable(projectfile) == true then
    print(projectfile)
    vim.fn.serverstart './godothost'
end
