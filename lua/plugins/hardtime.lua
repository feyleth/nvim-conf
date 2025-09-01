return {
  "m4xshen/hardtime.nvim",
  enabled = false,
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    restriction_mode = "hint",
    disabled_keys = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<Left>"] = {},
      ["<Right>"] = {},
    },
    disable_mouse = false,
  },
}
