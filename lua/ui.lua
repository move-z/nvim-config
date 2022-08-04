-- enable mouse
vim.opt.mouse = "a"

-- leave space for code diagnostics
vim.opt.signcolumn = "yes"

-- open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- colors in terminal (doesn't seem to work)
vim.opt.termguicolors = true


vim.cmd("colorscheme iceberg")

require('lualine').setup()

require('nvim-tree').setup({
    open_on_setup = true,
    open_on_setup_file = true,
})

require("indent_blankline").setup {
    space_char_blankline = " ",
    space_char_highlight_list = {
        "Comment",
    },
    char_highlight_list = {
        "Comment",
    },
}

