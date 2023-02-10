return {
    {
        "nvim-treesitter/nvim-treesitter",
        event={ "BufReadPost", "BufNewFile" },
        build=":TSUpdate",
        opts={
            auto_install = true,
            highlight={
                enable=true
            },
            indent = { enable = true},
            context_commentstring = { enable = true, enable_autocmd = false },
        },
        config=function (_,opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    }
}
