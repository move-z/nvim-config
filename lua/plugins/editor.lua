return {
  -- comment lines
  { "tpope/vim-commentary" },
  -- manage surrounding delimiters (parentheses, quotes, etc.)
  { "tpope/vim-surround" },
  -- treesitter syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    version = 'v0.9.x',
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
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require'treesitter-context'.setup{}
    end
  },
  -- insert copyright
  -- {
  --   "rdipardo/vim-cpywrite",
  --   version = 'v0.8.x',
  -- },
}

