return {
    {
        "neovim/nvim-lspconfig",
        event={ "BufReadPre", "BufNewFile" },
        dependencies={"ray-x/lsp_signature.nvim",opts={
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            hint_prefix = "",
    handler_opts = {
      border = "rounded"
    }
        },lazy=true},
        config=function ()
            local lspconfig = require('lspconfig')
            local lsp_defaults = lspconfig.util.default_config

            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )


            function desc(bufopts, desc)
                local options = {desc= desc}
                vim.tbl_extend("force",bufopts, options)
                return options
            end

            lsp_defaults.on_attach = function (client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                local bufopts = { noremap=true, silent=true, buffer=bufnr }

                vim.keymap.set( 'n', 'gD', function() require("telescope.builtin").lsp_references() end,desc(bufopts,'goto declaration'))
                vim.keymap.set( 'n', 'gd', function() vim.lsp.buf.definition() end,desc(bufopts,"goto definition"))
                vim.keymap.set( 'n', 'K', function() vim.lsp.buf.hover() end,desc(bufopts,"display info"))
                vim.keymap.set( 'n', 'gi', function() vim.lsp.buf.implementation() end,desc(bufopts,"goto implementation"))
                vim.keymap.set( 'n', '<C-k>', function() vim.lsp.buf.signature_help() end,desc(bufopts,"show signature"))
                vim.keymap.set( 'n', '<leader>wa', function() vim.lsp.buf.add_workspace_folder() end,desc(bufopts,"add folder to workspace"))
                vim.keymap.set( 'n', '<leader>wr', function() vim.lsp.buf.remove_workspace_folder() end,desc(bufopts,"remove folder from workspace"))
                vim.keymap.set( 'n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,desc(bufopts,"list all folder of workspace"))
                vim.keymap.set( 'n', '<leader>D', function() vim.lsp.buf.type_definition() end,desc(bufopts,"goto type definition"))
                vim.keymap.set( {'n','v'}, '<leader>cr', function() vim.lsp.buf.rename() end,desc(bufopts,"rename symbole"))
                vim.keymap.set( 'n', 'gr', function() require("telescope.builtin").references() end,desc(bufopts,"goto references"))
                vim.keymap.set( 'n', '<leader>ca', function() vim.lsp.buf.code_action() end,desc(bufopts,"code action"))
                -- vim.keymap.set( 'n', '<leader>so', function () require('telescope.builtin').lsp_document_symbols() end,desc(bufopts,"document symbole"))
                vim.keymap.set( 'n', '<leader>cd', function() vim.diagnostic.open_float(nil, {focus=false}) end,desc(bufopts,"code diagnostic"))
                -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
            end
        end
    },
    {
        "williamboman/mason.nvim",
        dependencies={"williamboman/mason-lspconfig.nvim"},
        event={ "BufReadPre", "BufNewFile" },
        config=function ()
            require("mason").setup()
            require("mason-lspconfig").setup({
                automatic_installation = false,
            })

            require("mason-lspconfig").setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
            }
        end
    }
}
