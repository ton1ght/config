vim.lsp.enable({
    "pyright",
    "texlab",
    "clangd",
})

vim.lsp.config("texlab", {
    settings = {
        texlab = {
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
                onSave = true,
            },
            build = {
                forwardSearchAfter = true,
            },
        },
    },
})
