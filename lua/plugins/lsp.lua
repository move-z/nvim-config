return {
  -- lspsaga
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      -- Please make sure you install markdown and markdown_inline parser
      "nvim-treesitter/nvim-treesitter",
    },
    -- event = "BufRead",
    config = function()
      require("lspsaga").setup ({
        lightbulb = {
          enable = false,
        },
        finder = {
          edit = "<CR>",
          quit = "<c-c>",
        },
        code_action = {
          keys = {
            quit = "<c-c>",
          },
        },
        ui = {
          kind = {
            ['File'] = {' ', '@comment' },
            ['Module'] = {' ', '@comment' },
            ['Namespace'] = {' ', '@comment' },
            ['Package'] = {' ', '@comment' },
            ['Class'] = {' ', '@comment' },
            ['Method'] = {' ', '@comment' },
            ['Property'] = {' ', '@comment' },
            ['Field'] = {' ', '@comment' },
            ['Constructor'] = {' ', '@comment' },
            ['Enum'] = {' ', '@comment' },
            ['Interface'] = {' ', '@comment' },
            ['Function'] = {'󰡱 ', '@comment' },
            ['Variable'] = {' ', '@comment' },
            ['Constant'] = {' ', '@comment' },
            ['String'] = {'󰅳 ', '@comment' },
            ['Number'] = {'󰎠 ', '@comment' },
            ['Boolean'] = {' ', '@comment' },
            ['Array'] = {'󰅨 ', '@comment' },
            ['Object'] = {' ', '@comment' },
            ['Key'] = {' ', '@comment' },
            ['Null'] = {'󰟢 ', '@comment' },
            ['EnumMember'] = {' ', '@comment' },
            ['Struct'] = {' ', '@comment' },
            ['Event'] = {' ', '@comment' },
            ['Operator'] = {' ', '@comment' },
            ['TypeParameter'] = {' ', '@comment' },
            -- -- ccls
            ['TypeAlias'] = {' ', '@comment' },
            ['Parameter'] = {' ', '@comment' },
            ['StaticMethod'] = {' ', '@comment' },
            ['Macro'] = {' ', '@comment' },
            -- -- for completion sb microsoft!!!
            ['Text'] = {'󰭷 ', '@comment' },
            ['Snippet'] = {' ', '@comment' },
            ['Folder'] = {' ', '@comment' },
            ['Unit'] = {'󰊱 ', '@comment' },
            ['Value'] = {' ', '@comment' },
          }
        }
      })
    end,
  },
  -- mason to manage tools installation
  {
    'williamboman/mason.nvim',
    version = 'v1.10.x',
    config = function()
      require("mason").setup()
    end
  },
  -- automatically download tools
  {
    'williamboman/mason-lspconfig.nvim',
    version = 'v1.31.x',
    dependencies = {
      'williamboman/mason.nvim',
    },
    config = function()
      local ml = require("mason-lspconfig")
      ml.setup({
        ensure_installed = {
          'pylsp',
        }
      })
      ml.setup_handlers {
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,
      }
    end
  },
  -- register tools
  {
    'neovim/nvim-lspconfig',
    version = 'v1.0.x',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require("lspconfig")["pylsp"].setup{}
      require("lspconfig")["rust_analyzer"].setup{}
    end
  },
  -- for tools that don't support lsp
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.rustfmt
        },
      })
    end
  },
  -- improved rust support
  {
    'simrat39/rust-tools.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('rust-tools').setup {}
    end
  },
}

