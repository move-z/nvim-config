-- block cursor
-- vim.opt.guicursor = ""

-- line margins
vim.opt.colorcolumn = "80,100,132"

-- highlight current line
vim.opt.cursorline = true

-- tab options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- enable smart indent
vim.opt.smartindent = true

-- indent wrapped lines
vim.opt.breakindent = true

-- better backspace behaviour
vim.opt.backspace = "indent,eol,start"

-- show special characters
vim.opt.list = true

-- special characters
vim.opt.listchars = "tab:⟩ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨"

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- show 5 lines of context on scroll
vim.opt.scrolloff = 5

-- show 5 characters of context on scroll
vim.opt.sidescrolloff = 5

-- show matching parentheses
vim.opt.showmatch = true

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    group = autogroup,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Treesitter folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

-- Completion options
vim.opt.completeopt = "menuone,noinsert,noselect"

-- spell checking
vim.opt.spell = true
vim.opt.spelllang = "en,it"

-- default copyright
-- vim.g["cpywrite#default_license"] = "GPL-3.0-or-later"

