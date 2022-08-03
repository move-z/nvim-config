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
Plug 'itchyny/lightline.vim'
-- tab bar
Plug 'romgrk/barbar.nvim'
-- tree view
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
-- theme
Plug 'dracula/vim'
-- rust tools
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'
vim.call('plug#end')

----------------------
--- plugins config ---
----------------------

vim.cmd("colorscheme dracula")

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

require('rust-tools').setup({})

-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.api.nvim_set_keymap("i", "<CR>", 
	"coc#pum#visible() ? coc#pum#confirm() : \"\\<CR>\"", 
	{ noremap = true, silent = true, expr = true })
-- Use <c-space> to trigger completion.
vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()", 
	{ noremap = true, silent = true, expr = true })
-- Make <escape> to abort
vim.api.nvim_set_keymap("i", "<escape>", 
	"coc#pum#visible() ? coc#pum#stop() : \"\\<escape>\"", 
	{ noremap = true, silent = true, expr = true })

-- Start NERDTree and put the cursor back in the other window.
vim.api.nvim_create_autocmd("VimEnter", 
	{ pattern = "*", command = "NERDTree | wincmd p" })
-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", 
	command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif" })
-- If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", 
	command = "if bufname('#') =~ 'NERD_tree_\\d\\+' && bufname('%') !~ 'NERD_tree_\\d\\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute \"normal! \\<C-W>w\" | execute 'buffer'.buf | endif" })

