return {
  -- lspsaga
  {
    "glepnir/lspsaga.nvim",
    tag = 'v0.2.9',
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
      })
    end,
  },
  -- mason to manage tools installation
  {
    'williamboman/mason.nvim',
    tag = 'v1.0.1',
    config = function()
      require("mason").setup()
    end
  },
  -- automatically download tools
  {
    'williamboman/mason-lspconfig.nvim',
    tag = 'v1.4.0',
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
    tag = 'v0.1.4',
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

