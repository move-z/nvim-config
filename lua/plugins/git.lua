return {
  -- add git symbols in sign column
  {
    "lewis6991/gitsigns.nvim",
    tag = "v0.6",
    config = function()
      require('gitsigns').setup({})
    end
  },
  -- git integration
  { "tpope/vim-fugitive" },
}
