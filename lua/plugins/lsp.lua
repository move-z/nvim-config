return {
  -- lspsaga
  {
    "glepnir/lspsaga.nvim",
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
    config = function()
      require("mason").setup()
    end
  },
  -- automatically register tools
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'pylsp',
          'rust_analyzer',
        }
      })
      require("lspconfig")["pylsp"].setup{}
      require("lspconfig")["rust_analyzer"].setup{}
    end
  },
  -- for tools that don't support lsp
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.rustfmt,
        },
      })
    end
  }
}

