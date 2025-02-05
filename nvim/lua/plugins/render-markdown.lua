return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    opts = {},
    config = function()
        require('render-markdown').setup({
            heading = {
                icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
                width = 'block',
                backgrounds = {
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                },
            },
            dash = {
                width = 100,
                icon = "-"
            },
            bullet = {
                icons = { '-', '-', '-', '-' },
            },
            checkbox = {
                enabled = false
            },
        })
    end
}
