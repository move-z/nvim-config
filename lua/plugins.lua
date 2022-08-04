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

vim.g.coc_global_extensions = {
--	'coc-ansible',
	'coc-css',
	'coc-docker',
	'coc-git',
	'coc-go',
	'coc-highlight',
	'coc-html',
	'coc-html-css-support',
	'coc-json',
	'coc-pyright',
	'coc-rust-analyzer',
--	'coc-symbol-line',
	'coc-toml',
	'coc-xml',
	'coc-yaml'
}

