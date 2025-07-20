return {
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function()
  --     require("nvim-autopairs").setup({})
  --   end
  -- },
  -- comment lines
  { "tpope/vim-commentary" },
  -- manage surrounding delimiters (parentheses, quotes, etc.)
  -- { "tpope/vim-surround" },
  -- treesitter syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    version = 'v0.10.x',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end, 
    config = function()
      require("nvim-treesitter.configs").setup({
        indent = { enable = true },
        auto_install = true,
        highlight = {
          enable = true,
        },
        -- needed by lspsaga
        ensure_installed = { "vim", "regex", "lua", "bash", "markdown", "markdown_inline" },
      })
    end
  },
  -- keep function signature visible
  {
    "nvim-treesitter/nvim-treesitter-context",
    version = 'v1.0.x',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require'treesitter-context'.setup{}
    end
  },
}

