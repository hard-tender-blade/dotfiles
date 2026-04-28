return {

  -- 1. Mason: installs LSP servers
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },

  -- 2. mason-lspconfig: bridges Mason with lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",          -- TypeScript / Next.js
        "tailwindcss",    -- Tailwind CSS
        "rust_analyzer",  -- Rust
      },
      automatic_installation = true,
    },
  },

  -- 3. nvim-lspconfig: configures the servers
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- TypeScript / Next.js
      lspconfig.ts_ls.setup({
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayFunctionLikeReturnTypeHints = true,
            },
          },
        },
      })

      -- Tailwind CSS
      lspconfig.tailwindcss.setup({
        filetypes = {
          "html", "css", "javascript",
          "typescript", "javascriptreact", "typescriptreact",
        },
      })

      -- Rust
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
            cargo = { allFeatures = true },
          },
        },
      })
    end,
  },

}
