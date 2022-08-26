-- map leader is space
vim.g.mapleader = " "

-- jump to pattern
vim.keymap.set('n', "<leader>h", function() vim.cmd('HopPattern') end)
-- file by name
vim.keymap.set('n', "<leader>f", function() vim.cmd('Telescope find_files') end)
-- live grep
vim.keymap.set('n', "<leader>F", function() require("telescope").extensions.live_grep_args.live_grep_args() end)
-- find symbol
vim.keymap.set('n', "<leader>S", function() vim.cmd('Telescope treesitter') end)
-- find all
vim.keymap.set('n', "<leader>?", function() vim.cmd('Telescope commands') end)

vim.keymap.set('n', '<c-l>', function() vim.cmd('nohlsearch') end)

-- code navigation
vim.keymap.set('n', '<leader>gd', '<Plug>(coc-definition)')
vim.keymap.set('n', '<leader>gt', '<Plug>(coc-type-definition)')
vim.keymap.set('n', '<leader>gi', '<Plug>(coc-implementation)')

-- lsp finder to find the cursor word definition and reference
 vim.keymap.set("n", "<leader>gw", function() vim.cmd("Lspsaga lsp_finder") end)

-- rename
vim.keymap.set("n", "<F2>", require("lspsaga.rename").lsp_rename)

-- diagnostics window
vim.keymap.set("n", "<leader>d", require("lspsaga.diagnostic").show_line_diagnostics)
-- diagnostics navigation
vim.keymap.set('n', '<leader>[', require("lspsaga.diagnostic").goto_prev)
vim.keymap.set('n', '<leader>]', require("lspsaga.diagnostic").goto_next)
-- action window
vim.keymap.set("n", "<leader>a", function() vim.cmd('Lspsaga code_action') end)
vim.keymap.set("v", "<leader>a", function() vim.cmd('Lspsaga range_code_action') end)

vim.api.nvim_create_user_command('CK', vim.diagnostic.setloclist, {})
vim.api.nvim_create_user_command('OL', ":LSoutlineToggle", {})

-- show documentation
vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.keymap.set("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm() : \"\\<cr>\"", { expr = true })
-- Use <c-space> to trigger completion.
vim.keymap.set("i", "<c-space>", "coc#refresh()", { expr = true })
-- Make <c-c> to abort
vim.keymap.set("i", "<c-c>", "coc#pum#visible() ? coc#pum#stop() : \"\\<c-c>\"", { expr = true })

-- Move to previous/next
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Pin/unpin buffer
vim.keymap.set('n', '<c-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
vim.api.nvim_create_user_command('Q', ':BufferClose', {})

-- Magic buffer-picking mode
vim.keymap.set('n', '<a-p>', '<cmd>BufferPick<CR>')

-- Spell check add rare word
vim.keymap.set('n', 'zr', function() vim.cmd('spellrare ' .. vim.fn.expand('<cword>')) end)
vim.keymap.set('n', 'zR', function() vim.cmd('spellrare! ' .. vim.fn.expand('<cword>')) end)
vim.keymap.set('n', 'zur', function() vim.cmd('spellundo ' .. vim.fn.expand('<cword>')) end)

