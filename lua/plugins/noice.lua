return {
    "folke/noice.nvim",
    dependencies={
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify"
    },
    event = "VeryLazy",
    opts={
        lsp = {
            progress={
                enabled=false,
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find="written"
                },
                opts = { skip = true },
            },
        },

    }
}
