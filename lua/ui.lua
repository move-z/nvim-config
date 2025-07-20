require("catppuccin").setup({
  flavour = "mocha"
})
vim.cmd.colorscheme "catppuccin"

-- unified status line
vim.opt.laststatus = 3

-- enable mouse
vim.opt.mouse = "a"

-- leave space for code diagnostics
-- vim.opt.signcolumn = "yes"

-- open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- colors in terminal (mandatory option)
vim.opt.termguicolors = true

-- configure float terminal
vim.g.floaterm_height = 0.99
vim.g.floaterm_width = 0.99

-- vim.diagnostic.config({ signs = { text = "", linehl = "DiagnosticSignError", numhl = "DiagnosticSignError" }})
-- vim.diagnostic.config({ signs = { text = "", linehl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }})
-- vim.diagnostic.config({ signs = { text = "", linehl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" }})
-- vim.diagnostic.config({ signs = { text = "", linehl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" }})

-- require('dap')
-- vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapLogPoint', {text='', texthl='', linehl='', numhl=''})

-- autoresize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
    group = autogroup,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end
})

