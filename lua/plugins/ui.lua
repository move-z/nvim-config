return {
  -- color scheme
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function() 
      vim.cmd([[colorscheme everforest]])
    end,
  },
  -- tab bar
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function() 
      require("lualine").setup({
        sections = {
          lualine_x = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = "#ff9e64" },
            },
          },
        },
      })
    end,
  },
  -- message ui
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        -- popupmenu = {
        --   backend = "cmp",
        -- },
        presets = {
          long_message_to_split = true,
        },
      })
    end
  },
  -- ui select
  {
    "stevearc/dressing.nvim"
  },
  -- highlight current word
  {
    'RRethy/vim-illuminate'
  },
  -- show indentation guides
  {
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
  },
}

