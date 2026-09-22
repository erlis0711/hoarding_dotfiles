vim.env.PATH = vim.env.PATH .. ":" .. "/usr/local/go/bin" .. ":" .. vim.env.HOME .. "/go/bin"
-- Buffer = Clipboard
vim.opt.clipboard = "unnamedplus"

require("config.options")
require("config.keybinds")
require("config.lazy")
