return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          mason = false,
          autostart = false,
        },
        pylsp = {
          mason = false,
          autostart = false,
        },
        -- basedpyright = {
        --  mason = false,
        --  autostart = false,
        -- },
      },
      inlay_hints = {
        enabled = true,
        exclude = {
          "tex",
        },
      },
    },
  },
}
