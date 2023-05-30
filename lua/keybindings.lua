vim.keymap.set('n', '<c-l>', function() vim.cmd('nohlsearch') end)

-- send to the void
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>D", "\"_D")

-- system clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("v", "<leader>P", "\"+P")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Move to previous/next
vim.keymap.set('n', '<A-,>', '<cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', '<cmd>BufferNext<CR>')
-- Re-order to previous/next
vim.keymap.set('n', '<A-<>', '<cmd>BufferMovePrevious<CR>')
vim.keymap.set('n', '<A->>', '<cmd>BufferMoveNext<CR>')
-- Pin/unpin buffer
vim.keymap.set('n', '<c-p>', '<cmd>BufferPin<CR>')
-- Close buffer
vim.api.nvim_create_user_command('Q', ':BufferClose', {})

-- Magic buffer-picking mode
vim.keymap.set('n', '<a-b>', '<cmd>BufferPick<CR>')
vim.keymap.set('n', "<leader>b", function() vim.cmd('Telescope buffers') end)

-- file by name
vim.keymap.set('n', "<leader>u", function() vim.cmd('Telescope undo') end)

-- jump to pattern
vim.keymap.set('n', "<leader>h", function() vim.cmd('HopPattern') end)
-- file by name
vim.keymap.set('n', "<leader>f", function() vim.cmd('Telescope find_files') end)
-- live grep
vim.keymap.set('n', "<leader>F", function() require("telescope").extensions.live_grep_args.live_grep_args() end)
-- choose content of " buffer
vim.keymap.set('n', "<leader>c", function() require('telescope').extensions.neoclip.default() end)
-- find symbol
vim.keymap.set('n', "<leader>s", function() vim.cmd('Telescope lsp_dynamic_workspace_symbols') end)
-- find all
vim.keymap.set('n', "<leader>?", function() vim.cmd('Telescope commands') end)

-- terminal
vim.keymap.set("n", '<f60>', '<cmd>FloatermToggle<CR>')
vim.keymap.set("t", '<f60>', '<c-\\><c-n><cmd>FloatermToggle<CR>')
-- Saner escape on terminal
vim.keymap.set('t', '<a-esc>', '<c-\\><c-n>')
-- run vim cmd
vim.keymap.set('t', '<a-c>', '<c-\\><c-n>')
-- send line to terminal
vim.api.nvim_create_user_command('Exec', ':FloatermSend', {})
vim.keymap.set("n", "<c-x>", function() vim.cmd("FloatermSend") end)

-- lsp finder to find the cursor word definition and reference
vim.keymap.set("n", "<leader>gh", function() vim.cmd("Lspsaga lsp_finder") end)
-- code navigation
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Lspsaga goto_definition') end)

-- rename
vim.keymap.set("n", "<F2>", function() vim.cmd('Lspsaga rename') end)

-- format code
vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format() end, {})
vim.keymap.set("n", "<leader>gf", function() vim.lsp.buf.format() end)
vim.keymap.set("v", "<leader>gf", function() vim.lsp.buf.format() end)

-- show documentation
vim.keymap.set("n", "K", function() vim.cmd('Lspsaga hover_doc') end)

-- diagnostics window
vim.keymap.set("n", "<leader>k", function() vim.diagnostic.open_float(nil, { focusable = false }) end)
-- diagnostics navigation
vim.keymap.set('n', '<leader>[', function() vim.cmd('Lspsaga diagnostic_jump_prev') end)
vim.keymap.set('n', '<leader>]', function() vim.cmd('Lspsaga diagnostic_jump_next') end)
-- action window
vim.keymap.set("n", "<leader>a", function() vim.cmd('Lspsaga code_action') end)
vim.keymap.set("v", "<leader>a", function() vim.cmd('Lspsaga range_code_action') end)

vim.keymap.set("n", "<leader>G", function() vim.cmd('Gitsigns preview_hunk_inline') end)

vim.keymap.set("n", "<leader>t", function() vim.cmd('Neotree toggle') end)
vim.keymap.set("n", "<leader>l", function() vim.cmd('Lspsaga outline') end)

-- Spell check add rare word
vim.keymap.set('n', 'zr', function() vim.cmd('spellrare ' .. vim.fn.expand('<cword>')) end)
vim.keymap.set('n', 'zR', function() vim.cmd('spellrare! ' .. vim.fn.expand('<cword>')) end)
vim.keymap.set('n', 'zur', function() vim.cmd('spellundo ' .. vim.fn.expand('<cword>')) end)

-- specific commands for crates
vim.api.nvim_create_user_command('CratePopup', function() require('crates').show_crate_popup() end, {})
vim.api.nvim_create_user_command('CrateVersions', function() require('crates').show_versions_popup() end, {})
vim.api.nvim_create_user_command('CrateFeatures', function() require('crates').show_features_popup() end, {})
vim.api.nvim_create_user_command('CrateDependencies', function() require('crates').show_dependencies_popup() end, {})

-- insert license
vim.api.nvim_create_user_command(
    'License',
    function(opts)
      vim.cmd('CPYwrite ' .. opts.args or '')
    end,
    {
      nargs = '?',
      complete = "customlist,cpywrite#licenses#GetLicenseList",
    })
