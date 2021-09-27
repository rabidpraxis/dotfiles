local lspconfig = require('lspconfig')
local completion = require('completion')

local function on_attach(client, buf)
  print('Attaching to ' .. client.name)
  completion.on_attach(client)
  vim.api.nvim_buf_set_option(buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local servers = { "clojure_lsp", "solargraph" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
