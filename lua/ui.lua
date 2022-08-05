-- enable mouse
vim.opt.mouse = "a"

-- leave space for code diagnostics
vim.opt.signcolumn = "yes"

-- open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- colors in terminal (doesn't seem to work)
vim.opt.termguicolors = true


vim.cmd("colorscheme hybrid")

require('lualine').setup()

require('nvim-tree').setup({
    open_on_setup = true,
    open_on_setup_file = true,
    filters = {
        dotfiles = true,
    }
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

-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown { }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

require("lspsaga").init_lsp_saga({
  finder_action_keys = {
    open = "<CR>",
    quit = "<c-c>",
  },
  code_action_keys = {
    quit = "<c-c>",
  },
})

