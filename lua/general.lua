-- don't save file backups in current dir
vim.opt.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup/"

-- improve cmd line completion
vim.opt.wildmode = "list:longest,full"

