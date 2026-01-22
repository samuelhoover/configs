return {
  -- add colorschemes here
  { "rebelot/kanagawa.nvim", enabled = false },
  { "catppuccin", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "ellisonleao/gruvbox.nvim", enabled = false },
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    gruvbox_material_background = "medium",
    gruvbox_material_enable_bold = 1,
    gruvbox_material_enable_italic = 1,
    gruvbox_material_dim_inactive_window = 1,
  },

  -- Configure LazyVim to load colorschemes
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
