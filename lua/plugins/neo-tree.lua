return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config=function ()
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            require("neo-tree").setup({
                window = {
                    mappings={
                        ["a"] = { 
                            "add",
                            config = {
                                show_path = "relative" -- "none", "relative", "absolute"
                            }
                        },
                    }
                },
                source_selector = {
                    winbar = false,
                    statusline = false
                },
                filesystem={
                    follow_current_file=true,
                    group_empty_dirs=true,
                },
                event_handlers = {

                    {
                        event = "file_opened",
                        handler = function(file_path)
                            --auto close
                            require("neo-tree").close_all()
                        end
                    },

                }

            })
        end,
        keys={
            {'<leader>e', '<cmd>Neotree<cr>',  desc = 'Explorer NeoTree' },
        }

    }
}
