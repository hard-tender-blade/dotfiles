return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-notify",
        "MunifTanjim/nui.nvim",

    },
    config = function() require("noice").setup() end

}
