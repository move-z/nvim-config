return {
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end, 
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = {
        enable = true,
      }
    })
    require'treesitter-context'.setup{}
  end
}

