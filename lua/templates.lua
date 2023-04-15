vim.api.nvim_create_autocmd(
    { "BufNewFile" },
    { pattern = { "*.rs" }, command = "0r ~/.config/nvim/templates/rust" }
)

