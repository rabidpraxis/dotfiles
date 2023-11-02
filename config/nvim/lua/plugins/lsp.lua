return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "standardrb",
          "gopls",
          "clangd",
        },
      }

      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      end

      -- Formatting
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format()
        end,
      })

      lspconfig = require("lspconfig")
      util = require("lspconfig/util")

      lspconfig.standardrb.setup {
        on_attach = on_attach,
      }
      require("lspconfig").clangd.setup {}

      -- Golang
      lspconfig.gopls.setup {
        cmd = {"gopls", "serve"},
        filetypes = {"go", "gomod"},
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        on_attach = on_attach,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      }

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
        end
      })
    end
  },
}
