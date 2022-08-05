require('lspconfig').rust_analyzer.setup({
	on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            },
        }
    }
})


require('rust-tools').setup({
    tools = {
        autoSetHints = false,
    }
})

