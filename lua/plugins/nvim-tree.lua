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
        filters = {
          dotfiles = true,
        }
      })
      local function open_nvim_tree()
        -- always open the tree
        require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
      end
     
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end
  },
}

