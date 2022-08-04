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
})

-- quit if nvim-tree is the last window
vim.api.nvim_create_autocmd("BufEnter", { 
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--            vim.cmd "NvimTreeClose"
--            vim.cmd "quit"
        end
    end
})

