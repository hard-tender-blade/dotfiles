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
k.set("n", "<D-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)                 -- Toggle line comment
k.set("x", "<D-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts) -- Toggle block comment
k.set("n", "<D-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)                                        -- Show code actions

-- Buffer manipulation
k.set("n", "<D-t>", "<cmd>Telescope find_files<cr>") -- Find files and open in buffer
k.set("n", "<D-w>", ":bd<CR>", opts)                 -- Delete current buffer
for i = 1, 10 do
    local key = string.format("<D-%d>", i % 10)
    k.set("n", key, string.format(":LualineBuffersJump %d<CR>", i), opts) -- Jump to buffer
end

-- Telescope
k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
k.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Search help tags" })
k.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

-- Miscellaneous
k.set("i", "jk", "<ESC>", opts) -- Exit insert mode with jk
k.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
k.set("n", "<leader>l", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })
k.set("n", "x", '"_x', { desc = "Delete character without yanking" })
k.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
k.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Copilot
k.set("i", "<D-p>", [[copilot#Accept("\<CR>")]], {
    silent = true,
    expr = true,
    script = true,
    replace_keycodes = false,
    desc = "Accept Copilot suggestion"
})

-- TODO test if i like this
-- Incremental selection (with treesitter)
--- gnn - Start selection
--- grn - Increment by node
--- grc - Increment by scope
--- grm - Decrement by node
