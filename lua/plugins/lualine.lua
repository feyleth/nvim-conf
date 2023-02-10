return {
    {  "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function(plugin)
            return {
                options = {
                    theme = "auto",
                    globalstatus = true,
                    disabled_filetypes = { statusline = { "lazy" } },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = {
                        {
                            "diagnostics",
                            sources = { 'nvim_diagnostic' },
                            symbols = { error = ' ', warn = ' ', info = ' ' },
                        },
                        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
                    },
                    lualine_x = {
                        {
                            function()
                                local msg = 'No Active Lsp'
                                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                                local clients = vim.lsp.get_active_clients()
                                if next(clients) == nil then
                                    return msg
                                end
                                for _, client in ipairs(clients) do
                                    local filetypes = client.config.filetypes
                                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                        return client.name
                                    end
                                end
                                return msg
                            end,
                            icon = ' LSP:',
                            -- color = { fg = '#ffffff', gui = 'bold' },
                        },
                        -- stylua: ignore
                        {
                            "diff",
                            symbols = { added = ' ', modified = '柳 ', removed = ' ' },
                        },
                    },
                    lualine_y = {
                        { "progress", separator = "", padding = { left = 1, right = 0 } },
                        { "location", padding = { left = 0, right = 1 } },
                    },
                    lualine_z = {
                        function()
                            return " " .. os.date("%R")
                        end,
                    },
                },
                extensions = { "neo-tree" },
            }
        end,
    },
    {"j-hui/fidget.nvim",event="VeryLazy",config=true}
}
