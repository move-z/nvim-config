local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  -- theme
  use 'sainnhe/everforest'

  -- manage tools installations
  use {
    'williamboman/mason.nvim',
    config = function() require("mason").setup() end
  }
  use 'williamboman/mason-lspconfig.nvim'

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require'lualine'.setup() end
  }

  -- tab bar
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- tree view
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('nvim-tree').setup {
        open_on_setup = true,
        open_on_setup_file = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
        },
        filters = {
          dotfiles = true,
        }
      }
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

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter'
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


    end
  }
  use {
    'nvim-telescope/telescope-live-grep-args.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }
  use {
    'nvim-telescope/telescope-ui-select.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension("ui-select")
    end
  }
  use {
    'xiyaowong/telescope-emoji.nvim',
    requires = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require("telescope").load_extension("emoji")
    end
  }

  -- line comment
  use 'tpope/vim-commentary'

  -- better syntax highlighting
  use 'sheerun/vim-polyglot'

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

  -- git integration
  use 'tpope/vim-fugitive'

  -- better dev ui
  use {
    'glepnir/lspsaga.nvim', 
    branch = 'main',
    config = function()
      require("lspsaga").init_lsp_saga {
        code_action_lightbulb = {
          enable = false,
        },
        finder_action_keys = {
          open = "<CR>",
          quit = "<c-c>",
        },
        code_action_keys = {
          quit = "<c-c>",
        },
      }
    end
  }

  -- code completion
  use {
    'neoclide/coc.nvim',
    branch = 'release',
  }

  use {
    'rcarriga/nvim-dap-ui',
    requires = {
      'mfussenegger/nvim-dap'
    },
    -- doesn't work here
    -- config = function() require('dapui').setup() end
  }

  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = {
      'mfussenegger/nvim-dap'
    },
    -- doesn't work here
    -- config = function() require('nvim-dap-virtual-text').setup() end
  }

  use {
    'simrat39/rust-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require('rust-tools').setup({
        server = {
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
        },
        tools = {
          inlay_hints = {
            auto = false,
          },
          hover_actions = {
            auto_focus = true,
          },
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
--  'coc-ansible',
  'coc-css',
  'coc-docker',
  'coc-git',
  'coc-go',
  'coc-highlight',
  'coc-html',
  'coc-html-css-support',
  'coc-json',
--  'coc-pairs',
  'coc-pyright',
  'coc-rust-analyzer',
--  'coc-symbol-line',
  'coc-toml',
  'coc-xml',
  'coc-yaml'
}

