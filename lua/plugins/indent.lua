return {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = { "help", "neo-tree", "lazy", "mason" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
    {
        "echasnovski/mini.indentscope",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "help", "neo-tree", "lazy", "mason" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
        config = function(_, opts)
            opts = vim.tbl_deep_extend("force", { draw = { animation = require('mini.indentscope').gen_animation.none() }}, opts or {})
            require("mini.indentscope").setup(opts)
        end,
    }
}
