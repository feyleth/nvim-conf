return {
  {
    "folke/noice.nvim",
    -- enabled = false,
    opts = {
      -- popupmenu = {
      --   enabled = false,
      -- },
      cmdline = {
        view = "cmdline",
      },
      routes = {
        {
          filter = { kind = "" },
          opts = { skip = true },
        },
      },
    },
  },
}
