-- -- jump to pattern
vim.keymap.set('n', "<leader>h", function() vim.cmd('HopPattern') end)
-- file by name
vim.keymap.set('n', "<leader>f", function() vim.cmd('Telescope find_files') end)
-- live grep
vim.keymap.set('n', "<leader>F", function() require("telescope").extensions.live_grep_args.live_grep_args() end)
-- choose content of " buffer
vim.keymap.set('n', "<leader>y", function() require('telescope').extensions.neoclip.default() end)
-- find symbol
vim.keymap.set('n', "<leader>s", function() vim.cmd('Telescope lsp_dynamic_workspace_symbols') end)
-- lsp finder to find the cursor word definition and reference
vim.keymap.set("n", "<leader>gh", function() vim.cmd("Lspsaga lsp_finder") end)
-- code navigation
vim.keymap.set('n', '<leader>gd', function() vim.cmd('Lspsaga goto_definition') end)
-- find all
vim.keymap.set('n', "<leader>?", function() vim.cmd('Telescope commands') end)

vim.keymap.set('n', '<c-l>', function() vim.cmd('nohlsearch') end)

-- rename
vim.keymap.set("n", "<F2>", function() vim.cmd('Lspsaga rename') end)

-- diagnostics window
vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float(nil, { focusable = false }) end)
-- diagnostics navigation
vim.keymap.set('n', '<leader>[', function() vim.cmd('Lspsaga diagnostic_jump_prev') end)
vim.keymap.set('n', '<leader>]', function() vim.cmd('Lspsaga diagnostic_jump_next') end)
-- action window
vim.keymap.set("n", "<leader>a", function() vim.cmd('Lspsaga code_action') end)
vim.keymap.set("v", "<leader>a", function() vim.cmd('Lspsaga range_code_action') end)

vim.keymap.set("n", "<leader>G", function() vim.cmd('Gitsigns preview_hunk_inline') end)

vim.keymap.set("n", "<leader>wt", function() vim.cmd('NvimTreeToggle') end)
vim.keymap.set("n", "<leader>wl", function() vim.cmd('Lspsaga outline') end)
vim.keymap.set("n", "<leader>wk", vim.diagnostic.setloclist)

-- show documentation
vim.keymap.set("n", "K", function() vim.cmd('Lspsaga hover_doc') end)

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

-- Spell check add rare word
vim.keymap.set('n', 'zr', function() vim.cmd('spellrare ' .. vim.fn.expand('<cword>')) end)
vim.keymap.set('n', 'zR', function() vim.cmd('spellrare! ' .. vim.fn.expand('<cword>')) end)
vim.keymap.set('n', 'zur', function() vim.cmd('spellundo ' .. vim.fn.expand('<cword>')) end)

-- Saner escape on terminal
vim.keymap.set('t', '<a-esc>', '<c-\\><c-n>')

