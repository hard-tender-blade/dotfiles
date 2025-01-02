local o = vim.opt
local g = vim.g

-- TODO text if i like it
vim.diagnostic.config({
    signs = true,        -- show signs in the gutter (left to the line numbers)
})
o.signcolumn     = "yes" -- show sign column so that text doesn't shift

g.mapleader      = " "
g.maplocalleader = "\\"

o.number         = true
o.relativenumber = true
o.splitbelow     = true
o.splitright     = true
o.wrap           = false
o.expandtab      = true -- use spaces instead of tabs
o.tabstop        = 4    -- number of spaces that a <tab> in the file counts for
o.shiftwidth     = 4    -- number of spaces that a <tab> counts for while indenting
o.clipboard      = "unnamedplus"
o.scrolloff      = 999
o.virtualedit    = "block"
o.ignorecase     = true
o.termguicolors  = true          -- enable 24-bit rgb color in the terminal
o.showmode       = false         -- hide default mode line etc.
o.laststatus     = 0             -- hide the status line unless there are multiple windows

o.ignorecase     = true          -- ignore case when searching
o.smartcase      = true          -- if you include mixed case in your search, assumes you want case-sensitive

o.backspace      = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position


o.syntax     = "on" -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
o.wildmenu   = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
