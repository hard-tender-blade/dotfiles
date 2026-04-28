return {
    'https://github.com/nvim-lualine/lualine.nvim',
    dependencies = { 'https://github.com/nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = '',
                section_separators = '',
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                }
            },
            tabline = {
                lualine_a = { 'mode' },
                lualine_b = {},
                lualine_c = { 'buffers' },
                lualine_x = {},
                lualine_y = { 'diagnostics' },
                lualine_z = {}
            },
            inactive_sections = {},
            sections = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
