-- don't save file backups in current dir
vim.opt.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup/"

-- improve cmd line completion
vim.opt.wildmode = "list:longest,full"

-- set fish shell
vim.opt.shell = "fish"

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.api.nvim_command("startinsert")
  end
})

