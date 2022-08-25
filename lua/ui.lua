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

vim.fn.sign_define(
  "DiagnosticSignError",
  { texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarning",
  { texthl = "DiagnosticSignWarning", text = "", numhl = "DiagnosticSignWarning" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
  { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" }
)
vim.fn.sign_define(
  "DiagnosticSignInformation",
  { texthl = "DiagnosticSignInformation", text = "", numhl = "DiagnosticSignInformation" }
)

