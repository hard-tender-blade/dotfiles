return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        _G.last_opened_terminal = 1

        function _G.toggleterm_open(count)
            local term = require("toggleterm.terminal").get(count, true)

            if term ~= nil then
                term:toggle()
            else
                local new_term = function()
                    return require("toggleterm.terminal").Terminal:new({
                        display_name = string.format("Terminal %d", count),
                        count = count,
                        dir = "git_dir",
                        direction = "float",
                        float_opts = {
                            border = "single",
                        },
                        on_create = function(current_term)
                            for i = 1, 10 do
                                local key = string.format("<D-%d>", i)
                                vim.api.nvim_buf_set_keymap(current_term.bufnr, "t", key,
                                    string.format("<cmd>ToggleTerm<cr><cmd>lua toggleterm_open(%d)<cr>", i),
                                    { noremap = true, silent = true })
                            end

                            vim.api.nvim_buf_set_keymap(current_term.bufnr, "n", "<D-o>",
                                string.format("<cmd>ToggleTerm<cr>", count),
                                { noremap = true, silent = true })
                            vim.api.nvim_buf_set_keymap(current_term.bufnr, "t", "<D-o>",
                                string.format("<cmd>ToggleTerm<cr>", count),
                                { noremap = true, silent = true })
                            vim.api.nvim_buf_set_keymap(current_term.bufnr, "n", "<esc>",
                                string.format("<cmd>ToggleTerm<cr>", count),
                                { noremap = true, silent = true })
                            vim.api.nvim_buf_set_keymap(current_term.bufnr, "t", "<esc>",
                                string.format("<cmd>ToggleTerm<cr>", count),
                                { noremap = true, silent = true })
                        end,
                    })
                end

                new_term():toggle()
            end

            last_opened_terminal = count
        end

        require("toggleterm").setup({})
    end
}
