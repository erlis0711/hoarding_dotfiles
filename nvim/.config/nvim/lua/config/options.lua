-- vim.opt.autochdir = true
local o = vim.opt

o.number = true
o.relativenumber = true
o.mouse = "a"
o.clipboard = "unnamedplus" -- use system clipboard
o.breakindent = true
o.undofile = true -- persistent undo history
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes" -- always show the gutter (diagnostics live here)
o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.termguicolors = true
o.cursorline = true
o.wrap = false
-- Folding options for treesitter:
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99 -- Keeps files fully open by default when you open them
