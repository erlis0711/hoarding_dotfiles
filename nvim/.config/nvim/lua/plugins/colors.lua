return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Ensures the theme loads immediately on startup
		priority = 1000, -- Forces the theme to load before other plugins
		opts = {
			transparent = true,
			on_highlights = function(hl, c)
				-- Replace "#737aa2" with whatever hex color you actually want
				local my_custom_color = "#a34f2e"

				-- Override all potential groups Neovim uses for non-current lines
				hl.LineNr = { fg = my_custom_color }
				hl.LineNrAbove = { fg = my_custom_color }
				hl.LineNrBelow = { fg = my_custom_color }
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
