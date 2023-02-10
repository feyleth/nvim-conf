return {
    -- {
    --     "RRethy/nvim-base16",
    --     config=function()
    --         vim.cmd([[colorscheme base16-gruvbox-dark-medium]])
    --     end
    -- }
    {
        "ellisonleao/gruvbox.nvim",
        config=function()
            vim.o.background="dark"
            vim.cmd([[colorscheme gruvbox]])
        end
    }
}
