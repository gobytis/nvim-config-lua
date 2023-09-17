require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    -- NOTE: fortls でエラーが出ていたため試したものです。
    -- Reference hilight の設定を無効にすることで対応したので
    -- 現在は下記の処理はコメントアウトしています。
    -- on_attach = function(client, bufnr)
    --   -- Find the clients capabilities
    --   local cap = client.resolved_capabilities
    --   -- Only highlight if compatible with the language
    --   if cap.document_highlight then
    --       vim.cmd('augroup LspHighlight')
    --       vim.cmd('autocmd!')
    --       vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
    --       vim.cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
    --       vim.cmd('augroup END')
    --   end
    -- end
  }
  require('lspconfig')[server].setup(opt)
end })