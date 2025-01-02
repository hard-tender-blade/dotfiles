return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                -- this is for the nvim lua config files to see signatures etc.
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            {
                "pmizio/typescript-tools.nvim",
                dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
                opts = {},
            }
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- brew install lua-language-server
            require('lspconfig').lua_ls.setup { capabilities = capabilities }

            -- npm install -g typescript-language-server typescript
            require('lspconfig').ts_ls.setup { capabilities = capabilities }

            -- npm install -g @tailwindcss/language-server
            require('lspconfig').tailwindcss.setup { capabilities = capabilities }

            -- npm install -g @olrtg/emmet-language-server
            require('lspconfig').emmet_language_server.setup { capabilities = capabilities }

            -- npm i -g vscode-langservers-extracted
            require('lspconfig').cssls.setup { capabilities = capabilities }

            -- npm i -g vscode-langservers-extracted
            require('lspconfig').jsonls.setup { capabilities = capabilities }

            -- npm i -g bash-language-server
            require('lspconfig').bashls.setup { capabilities = capabilities }

            -- npm i -g dockerfile-language-server-nodejs
            require('lspconfig').dockerls.setup { capabilities = capabilities }



            -- install all lsps command:
            -- npm i -g typescript-language-server typescript @tailwindcss/language-server @olrtg/emmet-language-server vscode-langservers-extracted bash-language-server dockerfile-language-server-nodejs
            -- brew install lua-language-server
        end
    }
}
