return {
  -- color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  -- tab bar
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    version = 'v1.9.x',
  },
  {
    'Bekaboo/dropbar.nvim',
        version = 'v14.0.x',
    -- optional, but required for fuzzy finder support
    --dependencies = {
    --  'nvim-telescope/telescope-fzf-native.nvim',
    --  build = 'make'
    --},
    --config = function()
    --  local dropbar_api = require('dropbar.api')
    --  vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
    --  vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
    --  vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    --end
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
    version = 'v4.10.x',
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
    "folke/snacks.nvim",
    version = 'v2.22.x',
    lazy = false,
    enabled = true,
  },
  -- highlight current word
  {
    'RRethy/vim-illuminate'
  },

  -- show indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    version = '3.9.x',
    config = function()
      require("ibl").setup {}
    end
  },
}

