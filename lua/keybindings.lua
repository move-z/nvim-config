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
vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
-- alt-e action window
vim.keymap.set('n', '<a-e>', vim.lsp.buf.code_action, opts)

vim.api.nvim_create_user_command('CK', vim.diagnostic.setloclist, {})

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

-- for barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
vim.api.nvim_create_user_command('Q', ':BufferClose', {})

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

