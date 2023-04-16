return {
  -- add git symbols in sign column
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({})
    end
  },
  -- git integration
  { "tpope/vim-fugitive" },
}
