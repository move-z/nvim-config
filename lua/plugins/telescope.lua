return {
  -- finder
  {
    'nvim-telescope/telescope.nvim',
    version = 'v0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          layout_strategy = 'vertical',
          -- layout_config = {
          --   height = 0.99,
          --   width = 0.99,
          -- }
        },
        live_grep_args = {
          auto_quoting = false
        },
      })
    end
  },
  -- improve search speed
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('telescope').load_extension('fzf')
    end
  },
  -- search file content
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    version = 'v1.1.x',
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('telescope').load_extension('live_grep_args')
    end
  },
  -- find emoji
  {
    'xiyaowong/telescope-emoji.nvim',
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require("telescope").load_extension("emoji")
    end
  },
  -- clipboard history
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
      {'kkharji/sqlite.lua', module = 'sqlite'},
    },
    config = function()
      require('neoclip').setup({
        enable_persistent_history = true,
      })
      require('telescope').load_extension('neoclip')
    end,
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require("telescope").load_extension("undo")
    end
  }
}

