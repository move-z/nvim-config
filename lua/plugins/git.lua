return {
  -- add git symbols in sign column
  {
    "lewis6991/gitsigns.nvim",
    version = "v1.0.x",
    config = function()
      require('gitsigns').setup({})
    end
  },
  -- git integration
  -- { "tpope/vim-fugitive" },
}
