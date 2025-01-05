return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = "float",
            size = 25,
            open_mapping = [[<D-o>]],
        })
    end
}
