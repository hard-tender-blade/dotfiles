---@diagnostic disable: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        -- Allow to auto rename html tag with ""
        {
            "https://github.com/windwp/nvim-ts-autotag",
            config = function()
                require('nvim-ts-autotag').setup()
            end,
        },
    },
    config = function()
        require("nvim-treesitter.configs").setup {
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {
                "bash", "comment", "css", "csv", "dot", "dockerfile",
                "git_config", "git_rebase", "gitattributes", "gitcommit",
                "gitignore", "html", "javascript", "json", "lua",
                "markdown", "scss", "sql", "toml", "tsx", "typescript",
                "vim", "yaml"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = { "typescript" },
            },
            autotag = { enable = true },
            enable_autocmd = false,
            auto_install = true,
            incremental_selection = {
                enable = true,
            },
        }
    end
}
