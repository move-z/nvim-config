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
    'mason-org/mason.nvim',
    version = 'v2.0.x',
    config = function()
      require("mason").setup()
    end
  },
  -- automatically download tools
  {
    'mason-org/mason-lspconfig.nvim',
    version = 'v2.0.x',
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
    end
  },
  -- register tools
  {
    'neovim/nvim-lspconfig',
    version = 'v2.1.x',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require("lspconfig")["pylsp"].setup{}
--      require("lspconfig")["rust_analyzer"].setup{}
    end
  },
  -- for tools that don't support lsp
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.gitsigns
        },
      })
    end
  },
  -- improved rust support
  {
    'mrcjkb/rustaceanvim',
    version = '6.1.x',
    lazy = false,
  },
}

