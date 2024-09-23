local util = require('lspconfig/util')

local path = util.path

local M = {}
function M.get_python_path()
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- Find and use virtualenv from pipenv in workspace directory.
    return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

return M
