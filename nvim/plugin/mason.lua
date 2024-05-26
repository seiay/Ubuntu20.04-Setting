require('mason').setup {
  ui = {
    check_outdated_packages_on_open = false,
    --  border = 'single',
  },
}
-- masonでインストールしたLSをlspconfigで使えるようにする
require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {}
  end,
}
