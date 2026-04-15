Config.now_if_args(function ()
  vim.pack.add({"https://github.com/folke/snacks.nvim","https://github.com/stevearc/oil.nvim"})
  require("oil").setup()
  vim.api.nvim_create_autocmd("User", {
    pattern = "OilActionsPost",
    callback = function(event)
        if event.data.actions[1].type == "move" then
            require("snacks").rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
        end
    end,
  })
end)
