return {
    "rcarriga/nvim-notify",
    lazy = true,
    event = "VeryLazy",
    config = function()
        -- require notify
        local notify = require("notify")

        -- custom setup
        notify.setup({
            stages = "fade",    -- animation style
            render = "minimal", -- notification appearance: default|simple
            timeout = 800,      -- time to out
            merge_duplicates = true,
        })

        -- set notify as the default notification window
        vim.notify = notify
    end,
}