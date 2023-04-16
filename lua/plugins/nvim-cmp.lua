return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'windwp/nvim-autopairs',
      'onsails/lspkind.nvim',
      'saecki/crates.nvim',
    },
    config = function()
      -- Completion Plugin Setup
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      cmp.setup({
        mapping = {
          ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-c>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          })
        },
        preselect = cmp.PreselectMode.None,
        -- Installed sources:
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help'},
          { name = 'buffer' },
          { name = 'spell' },
          { name = 'path' },
          { name = 'crates' },
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format({
            -- mode = 'symbol', -- show only symbol annotations
            -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          })
        }
      })

      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'f3fora/cmp-spell' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
}

