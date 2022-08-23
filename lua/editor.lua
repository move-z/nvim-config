-- line margins
vim.opt.colorcolumn = "80,100,120,132"

-- highlight current line
vim.opt.cursorline = true

-- show special characters
vim.opt.list = true

-- special characters
vim.opt.listchars = "tab:⟩ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨"

-- show line numbers
vim.opt.number = true
--vim.opt.relativenumber = true

-- show 3 lines of context on scroll
vim.opt.scrolloff = 3

-- show matching parentheses
vim.opt.showmatch = true

-- show 5 characters of context on scroll
vim.opt.sidescrolloff = 5

-- spell checking
vim.opt.spell = true
vim.opt.spelllang = "en,it"


require('hop').setup()

vim.api.nvim_create_autocmd("CursorHold", { 
    callback = function() vim.fn.CocActionAsync('highlight') end
})

require("telescope").load_extension("live_grep_args")

