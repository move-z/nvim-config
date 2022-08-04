local opts = { noremap=true, silent=true, expr=true }
-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.keymap.set("i", "<CR>", 
	"coc#pum#visible() ? coc#pum#confirm() : \"\\<CR>\"", opts)
-- Use <c-space> to trigger completion.
vim.keymap.set("i", "<c-space>", "coc#refresh()", opts)
-- Make <c-c> to abort
vim.keymap.set("i", "<c-c>", "coc#pum#visible() ? coc#pum#stop() : \"\\<c-c>\"", 
	opts)

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<c-e>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

vim.keymap.set('n', 'f', ':HopPattern<CR>')
