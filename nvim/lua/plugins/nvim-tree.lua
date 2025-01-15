return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', '<tab>', api.node.open.edit, opts('Open'))
        end

        nvimtree.setup({
            on_attach = my_on_attach,
            view = {
                width = 55,
                side = "right",
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = false,
                },

                icons = {
                    git_placement = "after",
                    glyphs = {
                        folder = {
                            arrow_closed = "", -- arrow when folder is closed
                            arrow_open = "",   -- arrow when folder is open
                        },
                        git = {
                            unstaged = "M",  -- Changes not staged (modified files)
                            staged = "A",    -- Newly added files staged for commit
                            unmerged = "",
                            renamed = "M",   -- Renamed files
                            untracked = "A", -- New files not tracked by Git
                            deleted = "D",   -- Deleted files
                            ignored = "I",
                        }
                    },

                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                    quit_on_open = true,
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                enable = true,
            },
        })

        -- set keymaps
        local keymap = vim
            .keymap -- for conciseness

        keymap.set("n", "<D-e>", "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    end
}
