-- Add this to your Neovim plugin configuration (e.g., ~/.config/nvim/lua/plugins/java.lua)
return {
	{
		"nvim-java/nvim-java",
		config = function()
			require("java").setup()
			vim.lsp.enable("jdtls")
		end,
	},
}
