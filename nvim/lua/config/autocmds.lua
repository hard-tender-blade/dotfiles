-- Avoid disrupting special windows like plugin windows
vim.api.nvim_create_autocmd("WinNew", {
    callback = function()
        local win_type = vim.fn.win_gettype()
        if win_type == "" then  -- Ignore special windows like floating or plugin windows
            vim.cmd("wincmd L") -- Move new window to the far right
        end
    end,
})

-- Automatically format on save using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
    callback = function()
        vim.lsp.buf.format({ async = false })           -- Set async = true if you want it to be non-blocking
        require("notify")("Formatted with LSP", "info") -- Notify that the file was formatted
    end,
})
