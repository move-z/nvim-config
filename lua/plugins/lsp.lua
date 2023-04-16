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
          'rust_analyzer',
        }
      })
      require("lspconfig")["gopls"].setup{}
      require("lspconfig")["pyright"].setup{}
      require("lspconfig")["rust_analyzer"].setup{}
    end
  },
}

