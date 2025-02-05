local k = vim.keymap

-- Keymap options
local opts = { noremap = true, silent = true }

-- General keymaps
k.set("n", "<D-s>", ":wa<CR>", opts)                                                                       -- Save all files
k.set("i", "<D-s>", "<Esc>:wa<CR>li", opts)                                                                -- Save all files and return to insert mode
k.set("n", "<D-q>", ":wa<CR>:qa<CR>", opts)                                                                -- Quit Neovim after saving
k.set("i", "<D-q>", "<Esc>:wa<CR>:qa<CR>", opts)                                                           -- Quit Neovim and return to insert mode
k.set("n", "<D-e>", "<cmd>Yazi<CR>", { desc = "Open Yazi on current file" })                               -- Open Yazi
k.set("n", "<D-r>", ":lua vim.lsp.buf.rename()<CR>", opts)                                                 -- Rename variable
k.set("i", "<D-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)                 -- Toggle line comment
k.set("n", "<D-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)                 -- Toggle line comment
k.set("x", "<D-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts) -- Toggle block comment
k.set("n", "<D-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)                                        -- Show code actions
k.set("n", "<D-l>", "<cmd>LazyGit<cr>", opts)                                                              -- Open LazyGit
k.set("n", "<D-n>", ":nohl<CR>", opts)                                                                     -- Clear search highlights
-- k.set("i", "<D-p>", [[copilot#Accept("\<CR>")]], {
--     silent = true,
--     expr = true,
--     script = true,
--     replace_keycodes = false,
--     desc = "Accept Copilot suggestion"
-- })

-- Buffer manipulation
k.set("n", "<D-t>", "<cmd>Telescope find_files<cr>") -- Find files and open in buffer
k.set("n", "<D-w>", ":bd<CR>", opts)                 -- Delete current buffer
for i = 1, 10 do
    local key = string.format("<D-%d>", i % 10)
    k.set("n", key, string.format(":LualineBuffersJump %d<CR>", i), opts) -- Jump to buffer
    k.set("i", key, string.format(":LualineBuffersJump %d<CR>", i), opts) -- Jump to buffer
end

-- Telescope
k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
k.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Search help tags" })
k.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
k.set("n", "<leader>ss", ":STSessionStart<cr>", { desc = "Start session", silent = true })
k.set("n", "<leader>sk", ":STSessionKill<cr>", { desc = "Kill session", silent = true })
k.set("n", "<leader>sl", ":STSessionTimeLeft<cr>", { desc = "Show time left", silent = true })

-- Other
k.set("n", "<leader>sh", ":lua vim.lsp.buf.signature_help()<CR>", { desc = "Show signature help" })
k.set("n", "<leader>g", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })

-- Terminal
vim.keymap.set("n", "<D-o>",
    function()
        toggleterm_open(_G.last_opened_terminal)
    end,
    { noremap = true, silent = true })

-- Miscellaneous
k.set("i", "jk", "<ESC>", opts) -- Exit insert mode with jk
k.set("n", "x", '"_x', { desc = "Delete character without yanking" })
k.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
k.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Process Typescript files
local processTS = vim.schedule_wrap(function()
    vim.cmd("TSToolsAddMissingImports")
    vim.cmd("TSToolsSortImports")
    vim.cmd("TSToolsRemoveUnused")
    vim.cmd("TailwindSort")
    vim.notify("Processed TS file", vim.log.levels.INFO)
end)
k.set("n", "<leader>t", processTS, { desc = "Process TypeScript file" })
