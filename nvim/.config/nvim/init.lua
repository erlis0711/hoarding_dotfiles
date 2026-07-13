-- Buffer = Clipboard
vim.opt.clipboard = "unnamedplus"

-- Add Catppuccin theme repo
vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

-- THEME CONFIGURATION
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { 
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, 
    term_colors = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
    },
})
vim.cmd.colorscheme "catppuccin"
-- END OF CONFIGURATION
