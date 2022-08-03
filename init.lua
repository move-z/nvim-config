---------------
--- options ---
---------------

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
-- colors in terminal
vim.opt.termguicolors = true


---------------
--- plugins ---
---------------
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug 'neovim/nvim-lspconfig'
-- utils for other plugins
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
-- editorconfig
Plug 'editorconfig/editorconfig-vim'
-- better screen navigation
Plug 'phaazon/hop.nvim'
-- better syntax highlighting
Plug 'sheerun/vim-polyglot'
-- code completion
Plug('neoclide/coc.nvim', { branch = 'release' })
-- line comment
Plug 'tpope/vim-commentary'
-- file search
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('nvim-treesitter/nvim-treesitter')
-- git support
Plug 'tpope/vim-fugitive'
-- git diff
Plug 'sindrets/diffview.nvim'
-- status line
Plug 'nvim-lualine/lualine.nvim'
-- tab bar
Plug 'romgrk/barbar.nvim'
-- indentation marks on whitespaces
Plug 'lukas-reineke/indent-blankline.nvim'
-- tree view
Plug 'kyazdani42/nvim-tree.lua'
-- theme
Plug 'w0ng/vim-hybrid'
-- rust tools
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'
vim.call('plug#end')

----------------------
--- plugins config ---
----------------------

vim.cmd("colorscheme hybrid")

require('hop').setup()

require('lspconfig').rust_analyzer.setup({
	on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            },
        }
    }
})

require('lualine').setup()

require('rust-tools').setup({})

require('nvim-tree').setup({
    open_on_setup = true,
    open_on_setup_file = true,
})

-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.api.nvim_set_keymap("i", "<CR>", 
	"coc#pum#visible() ? coc#pum#confirm() : \"\\<CR>\"", 
	{ noremap = true, silent = true, expr = true })
-- Use <c-space> to trigger completion.
vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()", 
	{ noremap = true, silent = true, expr = true })
-- Make <escape> to abort
vim.api.nvim_set_keymap("i", "<backspace>", 
	"coc#pum#visible() ? coc#pum#stop() : \"\\<backspace>\"", 
	{ noremap = true, silent = true, expr = true })

-- quit if nvim-tree is the last window
vim.api.nvim_create_autocmd("BufEnter", { 
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--            vim.cmd "NvimTreeClose"
            vim.cmd "quit"
        end
    end
})

