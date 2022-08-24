-- jump to pattern
vim.keymap.set('n', '<leader>h', '<cmd>HopPattern<CR>')
-- file by name
vim.keymap.set("n", "<leader>f", '<cmd>Telescope find_files<CR>', {})
-- live grep
vim.keymap.set("n", "<leader>F", function() require("telescope").extensions.live_grep_args.live_grep_args() end)
--vim.keymap.set("n", "<leader>F", '<cmd>Telescope live_grep<CR>', {})

local opts = { noremap }

vim.keymap.set('n', '<c-l>', '<cmd>nohlsearch<CR>', opts)

-- code navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', opts)
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', opts)
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', opts)

-- lsp finder to find the cursor word definition and reference
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)

local opts = { noremap=true, silent=true }

-- rename
vim.keymap.set("n", "<F2>", require("lspsaga.rename").lsp_rename, opts)

-- ^e for diagnostics window
vim.keymap.set("n", "<leader>d", require("lspsaga.diagnostic").show_line_diagnostics, opts)
-- -- diagnostics navigation
vim.keymap.set('n', 'g[', require("lspsaga.diagnostic").goto_prev, opts)
vim.keymap.set('n', 'g]', require("lspsaga.diagnostic").goto_next, opts)
-- alt-e action window
vim.keymap.set("n", "<leader>a", require("lspsaga.codeaction").code_action, opts)

vim.api.nvim_create_user_command('CK', vim.diagnostic.setloclist, {})
vim.api.nvim_create_user_command('OL', ":LSoutlineToggle", {})

-- show documentation
--vim.keymap.set('n', 'K', function() vim.fn.CocActionAsync('doHover') end, opts)
vim.keymap.set("n", "K", require("lspsaga.hover").render_hover_doc, opts)

local opts = { noremap=true, silent=true, expr=true }

-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.keymap.set("i", "<CR>", 
	"coc#pum#visible() ? coc#pum#confirm() : \"\\<CR>\"", opts)
-- Use <c-space> to trigger completion.
vim.keymap.set("i", "<c-space>", "coc#refresh()", opts)
-- Make <c-c> to abort
vim.keymap.set("i", "<c-c>", "coc#pum#visible() ? coc#pum#stop() : \"\\<c-c>\"", 
	opts)

-- for barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Pin/unpin buffer
vim.keymap.set('n', '<c-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
vim.api.nvim_create_user_command('Q', ':BufferClose', {})

-- Magic buffer-picking mode
vim.keymap.set('n', '<a-p>', '<cmd>BufferPick<CR>', opts)

-- Spell check add rare word
vim.keymap.set('n', 'zr', function() vim.cmd('spellrare ' .. vim.fn.expand('<cword>')) end, opts)
vim.keymap.set('n', 'zR', function() vim.cmd('spellrare! ' .. vim.fn.expand('<cword>')) end, opts)
vim.keymap.set('n', 'zur', function() vim.cmd('spellundo ' .. vim.fn.expand('<cword>')) end, opts)
