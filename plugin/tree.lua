Config.later(function ()
  vim.pack.add({"https://github.com/nvim-tree/nvim-tree.lua","https://github.com/folke/snacks.nvim"})
  
  require("nvim-tree").setup({
    renderer={
      group_empty=true
    }
  })

  vim.keymap.set("n","\\","<cmd>NvimTreeOpen<cr>",{silent=true})

  local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
  vim.api.nvim_create_autocmd("User", {
    pattern = "NvimTreeSetup",
    callback = function()
      local events = require("nvim-tree.api").events
      events.subscribe(events.Event.NodeRenamed, function(data)
        if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
          data = data
          require("snacks").rename.on_rename_file(data.old_name, data.new_name)
        end
      end)
    end,
  })
end)
