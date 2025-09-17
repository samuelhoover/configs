return {
  -- add colorschemes here
  { "rebelot/kanagawa.nvim", enabled = true },
  { "catppuccin", enabled = false },
  { "folke/tokyonight.nvim", enabled = false },
  { "ellisonleao/gruvbox.nvim", enabled = false },

  -- Configure LazyVim to load colorschemes
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
