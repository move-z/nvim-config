return {
  -- finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        live_grep_args = {
          auto_quoting = false
        },
      })
    end
  },
  -- search file content
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
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
}

