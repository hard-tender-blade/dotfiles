return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        icons = {
            mappings = false, -- shows (default random) icons in the keymap
            breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
            separator = " ",  -- symbol used between a key and it's label
            group = " ",      -- symbol prepended to a group
            ellipsis = " ",
        },
        --       filter = function(mapping)
        --          return true
        -- return mapping.desc and (string.find(mapping.desc, "👈") or string.sub(mapping.desc, -1) == ".")
        --        end,
        --       spec = {
        --           { "<leader>f", group = "Find 👈" },
        --           { "<leader>t", group = "Tabs 👈" },
        --           { "<leader>g", group = "Goto/Git 👈" },
        --       }
    },
}
