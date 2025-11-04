if lazyvim_docs then
  -- LSP Server to use for Python.
  -- Set to "ruff" to use ruff instead of pyright.
  vim.g.lazyvim_python_lsp = "basedpyright"
end

local lsp = "basedpyright"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(
          opts.ensure_installed,
          { "ninja", "python", "rst", "toml" }
        )
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          enabled = lsp == "pyright",
          mason = false,
        },
        basedpyright = {
          enabled = lsp == "basedpyright",
          mason = true,
          autostart = true,
        },
        ruff = {
          enabled = true,
          mason = true,
          autostart = true,
          lint = {
            select = { "ALL" },
            preview = true,
          },
          format = {
            preview = true,
          },
        },
      },
      setup = {
        ruff_lsp = function()
          LazyVim.lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "mason-org/mason.nvim",
      ft = "python",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
      },
      config = function()
        local mason_registry = require("mason-registry")

        if not mason_registry.has_package("debugpy") then
          vim.notify("debugpy is not installed in Mason", vim.log.levels.ERROR)
          return
        end

        local debugpy = mason_registry.get_package("debugpy")
        local path = debugpy:get_install_path() .. "/venv/bin/python"
        require("dap-python").setup(path)
      end,
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = function(_, opts)
      if LazyVim.has("nvim-dap-python") then
        opts.dap_enabled = true
      end
      return vim.tbl_deep_extend("force", opts, {
        name = {
          "venv",
          ".venv",
          "env",
          ".env",
        },
      })
    end,
    keys = {
      { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },
}
