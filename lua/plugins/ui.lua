return {
  -- color scheme
  {
    "sainnhe/everforest",
    tag = 'v0.3.0',
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
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    version = '^1.0.0',
  },
  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("lualine").setup({})
    end,
  },
  -- message ui
  {
    "folke/noice.nvim",
    tag = 'v1.15.10',
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
    main = "ibl",
    version = '3.3.x',
    config = function()
      require("ibl").setup {}
    end
  },
}

