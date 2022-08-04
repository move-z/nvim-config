-- don't save file backups in current dir
vim.opt.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup/"

-- line margins
vim.opt.colorcolumn = "80,100,120,132"

-- highlight current line
vim.opt.cursorline = true

-- show special characters
vim.opt.list = true

-- special characters
vim.opt.listchars = "tab:⟩ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨"

-- enable mouse
vim.opt.mouse = "a"

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- show 3 lines of context on scroll
vim.opt.scrolloff = 3

-- show 5 characters of context on scroll
vim.opt.sidescrolloff = 5

-- leave space for code diagnostics
vim.opt.signcolumn = "yes"

-- open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- show matching parentheses
vim.opt.showmatch = true

-- colors in terminal (doesn't seem to work)
vim.opt.termguicolors = true

