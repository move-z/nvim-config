return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'gopls',
          'pyright',
          'rust_analyzer',
        }
      })
      require("lspconfig")["gopls"].setup{}
      require("lspconfig")["pyright"].setup{}
      require("lspconfig")["rust_analyzer"].setup{}
    end
  },
}

