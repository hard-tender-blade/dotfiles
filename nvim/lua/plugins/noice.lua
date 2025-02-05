return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline_popup"
            },
            messages = {
                enabled = true
            },
            notify = {
                enabled = false
            }
        })
    end

}
