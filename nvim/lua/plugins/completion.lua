return {

  -- snippet engine (required by cmp)
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },

  -- completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP source
      "hrsh7th/cmp-buffer",        -- words from current buffer
      "hrsh7th/cmp-path",          -- file paths
      "saadparwaiz1/cmp_luasnip",  -- snippet source
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },  -- LSP completions first
          { name = "luasnip" },   -- then snippets
          { name = "buffer" },    -- then buffer words
          { name = "path" },      -- then file paths
        }),
      })
    end,
  },

}
