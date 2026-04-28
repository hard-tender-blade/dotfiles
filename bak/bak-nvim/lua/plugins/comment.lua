return {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function(_, _)
        local opts = {
            ignore = "^$",
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
        require("Comment").setup(opts)
    end,
}
