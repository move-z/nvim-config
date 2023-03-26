return {
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
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').load_extension('ui-select')
    end
  },
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    config = function()
      require('telescope').load_extension('live_grep_args')
    end
  },
  {
    'xiyaowong/telescope-emoji.nvim',
    config = function()
      require("telescope").load_extension("emoji")
    end
  }
}

