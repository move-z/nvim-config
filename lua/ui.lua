-- unified status line
vim.opt.laststatus = 3

-- enable mouse
vim.opt.mouse = "a"

-- leave space for code diagnostics
vim.opt.signcolumn = "yes"

-- open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- colors in terminal (doesn't seem to work)
vim.opt.termguicolors = true


vim.cmd("colorscheme everforest")

vim.fn.sign_define( "DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" })
vim.fn.sign_define( "DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define( "DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" })
vim.fn.sign_define( "DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" })

require('dap')
vim.fn.sign_define('DapBreakpoint', {text='🚫', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='❓', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='⛔', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='📝', texthl='', linehl='', numhl=''})

local function open_nvim_tree()
    -- always open the tree
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
