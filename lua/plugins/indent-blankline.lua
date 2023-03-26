return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require("indent_blankline").setup {
      space_char_blankline = " ",
      space_char_highlight_list = {
        "Comment",
      },
      char_highlight_list = {
        "Comment",
      },
    }
  end
}

