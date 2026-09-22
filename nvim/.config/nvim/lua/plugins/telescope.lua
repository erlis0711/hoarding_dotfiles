return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({ cwd = vim.fn.getcwd() })
			end,
			desc = "Grep in Project",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Open Buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Document Symbols",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "LSP References",
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})
		pcall(telescope.load_extension, "fzf")
	end,
}
