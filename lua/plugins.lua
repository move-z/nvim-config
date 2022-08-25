local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- use 'wuelnerdotexe/vim-enfocado'
  use 'sainnhe/everforest'
  -- use 'phanviet/vim-monokai-pro'
  -- use 'arcticicestudio/nord-vim'
  -- use 'connorholyday/vim-snazzy'
  -- use 'sainnhe/sonokai'

  use {
    'neovim/nvim-lspconfig',
    config = function()
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
    end
  }


  -- editorconfig
  use 'editorconfig/editorconfig-vim'

  -- better screen navigation
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup()
    end
  }

  -- code completion
  use {
    'neoclide/coc.nvim',
    branch = 'release',
  }

  -- better syntax highlighting
  use 'sheerun/vim-polyglot'

  -- line comment
  use 'tpope/vim-commentary'

  -- file search
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local t = require('telescope')
      t.setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown { }
          },
          live_grep_args = {
            auto_quoting = false
          }
        }
      }

      t.load_extension("live_grep_args")

      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      t.load_extension("ui-select")
    end
  }

  -- git support
  use 'tpope/vim-fugitive'

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require'lualine'.setup()
    end
  }

  -- tab bar
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  } 
  -- Automatically set up your configuration after cloning packer.nvim

  -- indentation marks on whitespaces
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
          space_char_blankline = " ",
          space_char_highlight_list = {
              "Comment",
          },
          char_highlight_list = {
              "Comment",
          },
      }
    end
  }

  -- tree view
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('nvim-tree').setup({
          open_on_setup = true,
          open_on_setup_file = true,
          sync_root_with_cwd = true,
          update_focused_file = {
              enable = true,
          },
          filters = {
              dotfiles = true,
          }
      })
    end
  }

  -- better ui
  use {
    'glepnir/lspsaga.nvim', 
    branch = 'main',
    config = function()
      require("lspsaga").init_lsp_saga({
        finder_action_keys = {
          open = "<CR>",
          quit = "<c-c>",
        },
        code_action_keys = {
          quit = "<c-c>",
        },
      })
    end
  }
  
  use {
    'simrat39/rust-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('rust-tools').setup({
          tools = {
              autoSetHints = false,
          }
      })
    end
  }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

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

