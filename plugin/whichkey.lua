Config.later(function ()
    vim.pack.add({"https://github.com/folke/which-key.nvim.git"})
    local wk = require("which-key")
    wk.setup({})
    wk.add({
      {"<leader>f",group="+file"},
      {"<leader>g",group="+git"},
      {"<leader>c",group="+code"},
  })
end)
