return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
        },
        config = function(_,opts)
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup(opts)
            require("which-key").register({
                f={name="file/find"},
                g={name="git"},
                c={mode={"n","v"},name="code"},
                w={name="workspace"},
                s = { name = "search" },
                u={name="ui"}
            }, {prefix="<leader>"})
            require("which-key").register({
                i={
                    f={"inner function"},
                    c={"inner class"},
                    o={"inner other (block, conditon, loop)"}
                },
                a={
                    f={"around function"},
                    c={"around class"},
                    o={"around other (block, conditon, loop)"}
                }
            },{
                mode={"x","o"}
            })
        end,
    },
}
