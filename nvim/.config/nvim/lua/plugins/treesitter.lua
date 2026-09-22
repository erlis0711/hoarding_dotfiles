return {
  -- =====================================================================
  -- 1. THE CORE TREESITTER SYSTEM
  -- =====================================================================
  {
    "neovim-treesitter/nvim-treesitter",
    dependencies = {
      "neovim-treesitter/treesitter-parser-registry", -- Dynamically resolves queries per-language
    },
    lazy = false, -- Must load on startup so parsers are ready for open files
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.setup({
        -- Standard paths or internal options can go here if needed
      })

      -- List the languages you want to automatically download and install
      ts.install({
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "python",
        "javascript",
        "html",
        "css",
        "haskell",
        "java",
	      "c",
        "rust",
        "go"
      })

      -- Autocmds to enable native features on FileType change
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(event)
          -- A. Enable Highlighting
          pcall(vim.treesitter.start)

          -- B. Enable Indentation (Uses the new plugin indentexpr helper)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

          -- C. Enable Smart Code Folding (uncomment below if you like folding code blocks)
          -- vim.wo.foldmethod = "expr"
          -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
      })
    end,
  },

  -- =====================================================================
  -- 2. AUTO TAGS (Close & Rename HTML/JSX Tags)
  -- =====================================================================
  {
    "windwp/nvim-ts-autotag",
    -- event = { "BufReadPre", "BufNewFile" }, -- Load when opening file
    opts = {
      opts = {
        enable_close = true,          -- Auto-closes tags like <div> -> <div></div>
        enable_rename = true,         -- Renaming <div> to <p> renames the closing tag too
        enable_close_on_slash = true, -- Typing / inside a tag will close it
      }
    }
  }
}
