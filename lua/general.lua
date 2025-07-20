-- set in general and not in keybindings so that plugin loading sees the 
-- correct configuration
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- faster completion
vim.opt.updatetime = 250

-- still have to think about the right key to press
vim.opt.timeoutlen = 10000

-- improve cmd line completion
vim.opt.wildmode = "list:longest,full"

-- set fish shell
vim.opt.shell = "fish"

-- save undo history
vim.opt.undofile = true

-- -- start terminal in insert mode
-- vim.api.nvim_create_autocmd("TermOpen", {
--   callback = function()
--     vim.api.nvim_command("startinsert")
--   end
-- })

-- don't save file backups in current dir
vim.opt.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup/"

-- auto reload files
vim.opt.autoread = true

-- create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
    group = autogroup,
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end
})
