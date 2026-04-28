-- Automatically open winows to the right
vim.api.nvim_create_autocmd("WinNew", {
    callback = function()
        local win_type = vim.fn.win_gettype()
        if win_type == "" then  -- Ignore special windows like floating or plugin windows
            vim.cmd("wincmd L") -- Move new window to the far right
        end
    end,
})

-- General auto-formatting for all file types
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
    callback = function()
        vim.lsp.buf.format({ async = false }) -- Set async = true if you want it to be non-blocking
        vim.notify("Formatted with LSP", vim.log.levels.INFO)
    end,
})

-- Define terminal key mappings
local function set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'q', "<cmd>ToggleTerm<cr>", opts)
end

-- Create the autocmd for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*",
    callback = set_terminal_keymaps,
})

-- TypeScript-specific actions
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = vim.api.nvim_create_augroup("TypeScriptLspFormatting", { clear = true }),
--     pattern = { "*.ts", "*.tsx" },
--     callback = vim.schedule_wrap(function()
--         vim.cmd("TSToolsAddMissingImports")
--         vim.cmd("TSToolsSortImports")
--         vim.cmd("TSToolsRemoveUnused")
--         vim.cmd("TailwindSort")
--         vim.cmd("write")
--         vim.notify("Formatted and processed TypeScript", vim.log.levels.INFO)
--     end),
-- })
