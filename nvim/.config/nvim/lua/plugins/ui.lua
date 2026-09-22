return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = { { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" } },
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "tokyonight",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
}
