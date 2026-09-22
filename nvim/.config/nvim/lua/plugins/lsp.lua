return {
  -- Installs and manages language server / linter / formatter binaries
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- Bridges Mason-installed servers into Neovim's native LSP client
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      -- Servers to auto-install and auto-enable. Add more as you need them.
      ensure_installed = {
        "lua_ls",       -- Lua
        "pyright",      -- Python
        "ts_ls",        -- TypeScript / JavaScript
        "gopls",        -- Go
        "rust_analyzer",-- Rust
        "clangd",       -- C / C++
      },
    },
  },

  -- Ships default configs (root markers, filetypes, cmd) for hundreds of servers
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      -- ── Diagnostics look & feel ──────────────────────────────
      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
          },
        },
      })

      -- ── Per-server tweaks (optional) ─────────────────────────
      -- lua_ls needs to know Neovim's own Lua API to stop false warnings
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- ── Keymaps: only active in buffers that HAVE an LSP client ──
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to Definition")
          map("gD", vim.lsp.buf.declaration, "Go to Declaration")
          map("gr", vim.lsp.buf.references, "References")
          map("gi", vim.lsp.buf.implementation, "Go to Implementation")
          map("K", vim.lsp.buf.hover, "Hover Docs")
          map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
          map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
        end,
      })
    end,
  },
}
