return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('nvim-tree').setup({
        update_focused_file = {
          enable = true,
        },
        modified = {
          enable = true,
        },
	actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        filters = {
          dotfiles = true,
        }
      })

    local function open_nvim_tree(data)
      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1

      -- buffer is a [No Name]
      local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

      if not directory and not no_name then
        return
      end

      -- open the tree, find the file but don't focus it
      require("nvim-tree.api").tree.open()
    end

      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end
  },
}

