local opts = { noremap }

-- jump to pattern
vim.keymap.set('n', 'f', ':HopPattern<CR>')
-- file by name
vim.keymap.set("n", "F", ':Telescope find_files<CR>', {})
-- live grep
vim.keymap.set("n", "<a-f>", ':Telescope live_grep<CR>', {})

-- code navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', opts)
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', opts)
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', opts)
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', opts)

local opts = { noremap=true, silent=true }

-- ^e for diagnostics window
vim.keymap.set('n', '<c-e>', vim.diagnostic.open_float, opts)
-- diagnostics navigation
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- show documentation
vim.keymap.set('n', 'K', function() vim.fn.CocActionAsync('doHover') end, opts)

local opts = { noremap=true, silent=true, expr=true }

-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.keymap.set("i", "<CR>", 
	"coc#pum#visible() ? coc#pum#confirm() : \"\\<CR>\"", opts)
-- Use <c-space> to trigger completion.
vim.keymap.set("i", "<c-space>", "coc#refresh()", opts)
-- Make <c-c> to abort
vim.keymap.set("i", "<c-c>", "coc#pum#visible() ? coc#pum#stop() : \"\\<c-c>\"", 
	opts)

vim.api.nvim_create_user_command('CK', vim.diagnostic.setloclist, {})

