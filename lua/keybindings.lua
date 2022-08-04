-- Make <CR> to accept selected completion item or notify coc.nvim to format
vim.api.nvim_set_keymap("i", "<CR>", 
	"coc#pum#visible() ? coc#pum#confirm() : \"\\<CR>\"", 
	{ noremap = true, silent = true, expr = true })
-- Use <c-space> to trigger completion.
vim.api.nvim_set_keymap("i", "<c-space>", "coc#refresh()", 
	{ noremap = true, silent = true, expr = true })
-- Make <c-c> to abort
vim.api.nvim_set_keymap("i", "<c-c>", 
	"coc#pum#visible() ? coc#pum#stop() : \"\\<c-c>\"", 
	{ noremap = true, silent = true, expr = true })


