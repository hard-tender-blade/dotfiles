return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- {
            --     -- Lazy.nvim for Lua development
            --     "folke/lazydev.nvim",
            --     ft = "lua",
            --     opts = {
            --         library = {
            --             { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            --         },
            --     },
            -- },
            {
                -- TypeScript tools
                "pmizio/typescript-tools.nvim",
                dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
                opts = {},
                config = function()
                    require("typescript-tools").setup({
                        settings = {
                            separate_diagnostic_server = false,
                            publish_diagnostic_on = "change",
                            tsserver_file_preferences = {
                                importModuleSpecifierPreference = "non-relative",
                            }
                        }
                    })
                end,
            },
            -- {
            --     -- Copilot integration
            --     "zbirenbaum/copilot.lua",
            --     cmd = "Copilot",
            --     event = "InsertEnter",
            --     config = function()
            --         require("copilot").setup({
            --             suggestion = { enabled = false },
            --             panel = { enabled = false },
            --         })
            --     end,
            -- },
            -- {
            --     -- Copilot as a source for nvim-cmp
            --     "zbirenbaum/copilot-cmp",
            --     dependencies = { "zbirenbaum/copilot.lua" },
            --     config = function()
            --         require("copilot_cmp").setup()
            --     end,
            -- },
            {
                -- nvim-cmp and dependencies
                "hrsh7th/nvim-cmp",
                dependencies = {
                    "hrsh7th/cmp-nvim-lsp",     -- LSP completions
                    "hrsh7th/cmp-buffer",       -- Buffer completions
                    "hrsh7th/cmp-path",         -- Path completions
                    "saadparwaiz1/cmp_luasnip", -- Snippet completions
                    {

                        "L3MON4D3/LuaSnip",                                                                    -- Snippet engine
                        config = function()
                            require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" }) -- Load custom snippets too
                        end
                    },
                    "mlaursen/vim-react-snippets", -- React snippets
                    "onsails/lspkind.nvim",        -- Icons for completion items
                },
            },
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            require("vim-react-snippets").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Down>"] = cmp.mapping.select_next_item(),
                    -- ["<Right>"] = cmp.mapping.select_next_item(),
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    -- ["<Left>"] = cmp.mapping.select_prev_item(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                    -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                formatting = {
                    expandable_indicator = false,
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                    }),
                },
                sources = cmp.config.sources({
                    { name = 'render-markdown' }, -- .MD render
                    -- { name = "copilot" },  -- Copilot source
                    { name = "nvim_lsp" },        -- LSP source
                    { name = "luasnip" },         -- Snippet source
                    { name = "buffer" },          -- Buffer source
                    { name = "path" },            -- Path source
                }),
            })

            -- Setup LSP capabilities for cmp
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Update all existing LSP setups with enhanced capabilities
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup { capabilities = capabilities }
            -- lspconfig.ts_ls.setup { capabilities = capabilities } i think that typescript-tools do this already, its comented to avoid duplicates
            lspconfig.tailwindcss.setup { capabilities = capabilities }
            lspconfig.emmet_language_server.setup { capabilities = capabilities }
            lspconfig.cssls.setup { capabilities = capabilities }
            lspconfig.jsonls.setup { capabilities = capabilities }
            lspconfig.bashls.setup { capabilities = capabilities }
            lspconfig.dockerls.setup { capabilities = capabilities }
            lspconfig.clangd.setup { capabilities = capabilities }
            lspconfig.arduino_language_server.setup { capabilities = capabilities }

            -- lspconfig.gopls.setup { capabilities = capabilities }
            -- lspconfig.pylsp.setup {
            --     capabilities = capabilities,
            --     settings = {
            --         pylsp = {
            --             plugins = {
            --                 pycodestyle = {
            --                     ignore = { 'W391' },
            --                     maxLineLength = 100
            --                 }
            --             }
            --         }
            --     }
            -- }
        end,
    },
}
