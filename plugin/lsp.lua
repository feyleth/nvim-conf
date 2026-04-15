local nmap = function(lhs, rhs, desc)
  -- See `:h vim.keymap.set()`
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

Config.now_if_args(function()
  vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

  -- Use `:h vim.lsp.enable()` to automatically enable language server based on
  -- the rules provided by 'nvim-lspconfig'.
  -- Use `:h vim.lsp.config()` or 'after/lsp/' directory to configure servers.
  -- Uncomment and tweak the following `vim.lsp.enable()` call to enable servers.
  -- vim.lsp.enable({
  --   -- For example, if `lua-language-server` is installed, use `'lua_ls'` entry
  -- })
  Config.on_event("LspAttach",function ()
    nmap("<leader>ca",vim.lsp.buf.code_action,"code action")
    nmap("gd",vim.lsp.buf.definition,"Goto Definition")
    nmap("gr",vim.lsp.buf.references,"Goto References")
    nmap("gI",vim.lsp.buf.implementation,"Goto Implementation")
    nmap("gy",vim.lsp.buf.type_definition,"Goto T[y]pe Definition")
    nmap("gD",vim.lsp.buf.declaration,"Goto Declaration")
  end)

end)

-- 'mason-org/mason.nvim' (a.k.a. "Mason") is a great tool (package manager) for
-- installing external language servers, formatters, and linters. It provides
-- a unified interface for installing, updating, and deleting such programs.
--
-- The caveat is that these programs will be set up to be mostly used inside Neovim.
-- If you need them to work elsewhere, consider using other package managers.
--
-- You can use it like so:
Config.now_if_args(function()
  vim.pack.add({ 'https://github.com/mason-org/mason.nvim',"https://github.com/mason-org/mason-lspconfig.nvim", "https://github.com/j-hui/fidget.nvim" })
  require('mason').setup()
  require("mason-lspconfig").setup()
  require("fidget").setup{}
end)

