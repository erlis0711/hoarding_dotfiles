return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    
    -- REQUIRED for Harpoon 2
    harpoon:setup()

    -- Basic keymaps for file navigation
    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Harpoon add file" })
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon toggle quick menu" })

    -- Navigation between marked files
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon select file 1" })
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon select file 2" })
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon select file 3" })
    vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon select file 4" })

    -- Toggle previous & next buffers
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Harpoon prev file" })
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon next file" })

    -- Optional: Basic Telescope integration if you prefer it over the standard menu
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    vim.keymap.set("n", "<leader>hm", function() toggle_telescope(harpoon:list()) end, { desc = "Harpoon open in Telescope" })
  end
}
