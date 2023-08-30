return {
  -- jump to pattern
  {
    'ggandor/leap.nvim',
    dependencies = {
      "tpope/vim-repeat"
    },
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    'ggandor/flit.nvim',
    dependencies = {
      'ggandor/leap.nvim',
    },
    config = function()
      require('flit').setup({})
    end
  },
  {
    'axkirillov/hbac.nvim',
    config = function ()
      require("hbac").setup()
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        source_selector = {
          winbar = true,
          sources = {
            { source = "filesystem", display_name = " 󰉓 Files " },
            { source = "buffers", display_name = "  Buffers " },
            { source = "git_status", display_name = " 󰊢 Git " },
          },
        },
        filesystem = {
          window = {
            position = "float"
          }
        },
        default_component_configs = {
          icon = {
            -- folder_empty = "",
            folder_empty = "",
            folder_empty_open = "",
          },
          git_status = {
            symbols = {
              renamed   = "󰁕",
              unstaged  = "",
            },
          },
        },
        document_symbols = {
          kinds = {
            File = { icon = "󰈙", hl = "Tag" },
            Namespace = { icon = "󰌗", hl = "Include" },
            Package = { icon = "󰏖", hl = "Label" },
            Class = { icon = "󰌗", hl = "Include" },
            Property = { icon = "󰆧", hl = "@property" },
            Enum = { icon = "󰒻", hl = "@number" },
            Function = { icon = "󰊕", hl = "Function" },
            String = { icon = "󰀬", hl = "String" },
            Number = { icon = "󰎠", hl = "Number" },
            Array = { icon = "󰅪", hl = "Type" },
            Object = { icon = "󰅩", hl = "Type" },
            Key = { icon = "󰌋", hl = "" },
            Struct = { icon = "󰌗", hl = "Type" },
            Operator = { icon = "󰆕", hl = "Operator" },
            TypeParameter = { icon = "󰊄", hl = "Type" },
            StaticMethod = { icon = '󰠄 ', hl = 'Function' },
          }
        },
      })
    end
  },
  {
    'voldikss/vim-floaterm',
  },
}
