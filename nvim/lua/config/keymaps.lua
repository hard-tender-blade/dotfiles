local k = vim.keymap

local opts = { noremap = true, silent = false }

k.set("n", "<S-j>", "5j", opts)
k.set("n", "<S-k>", "5k", opts)

k.set("n", "<D-s>", ":wa<CR>", opts)                                                                       -- Save all files
k.set("i", "<D-s>", "<Esc>:wa<CR>li", opts)                                                                -- Save all files and return to insert mode

k.set("n", "<D-q>", ":wa<CR>:qa<CR>", opts)                                                                -- Quit Neovim after saving
k.set("i", "<D-q>", "<Esc>:wa<CR>:qa<CR>", opts)                                                           -- Quit Neovim and return to insert mode

k.set("i", "<D-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)                 -- Toggle line comment
k.set("n", "<D-/>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)                 -- Toggle line comment
k.set("x", "<D-/>", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts) -- Toggle block comment

k.set("i", "jk", "<ESC>", opts) -- Exit insert mode with jk
k.set("n", "x", '"_x') -- Delete character without yanking

-- Open nvim-tree window
k.set("n", "<D-e>", "<cmd>NvimTreeToggle<CR>", opts) -- toggle file explorer on current file
k.set("i", "<D-e>", "<cmd>NvimTreeToggle<CR>", opts) -- toggle file explorer on current file

-- Buffer manipulation
k.set("n", "<D-t>", "<cmd>Telescope find_files<cr>", opts) -- Find files and open in buffer
k.set("i", "<D-t>", "<ESC> <cmd>Telescope find_files<cr>", opts) -- Find files and open in buffer
k.set("n", "<D-w>", ":bd<CR>", opts)                       -- Delete current buffer
for i = 1, 10 do
    local key = string.format("<D-%d>", i % 10)
    k.set("n", key, string.format(":LualineBuffersJump %d<CR>", i), opts)       -- Jump to buffer
    k.set("i", key, string.format("<ESC> :LualineBuffersJump %d<CR>", i), opts) -- Jump to buffer
end

k.set("n", "<D-u>", "<cmd>Telescope projects<CR>", opts) -- Open project picker
k.set("i", "<D-u>", "<ESC><cmd>Telescope projects<CR>", opts) -- Open project picker