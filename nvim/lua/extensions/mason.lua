require('mason').setup {
  ui = {
--    check_outdated_packages_on_open = false,
      border = 'single',
  },
}

local lsp = require 'lspconfig'
-- masonでインストールしたLSをlspconfigで使えるようにする
require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    }
  end,
  -- (ここに mason.nvim でインストールした lsp の固有設定を必要に応じて追加
    ['lua_ls'] = function()
    lsp.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        },
      },
    }
  end,
  ['rust_analyzer'] = function()
  lsp.rust_analyzer.setup {
    settings = {
      ['rust-analyzer'] = {
        diagnostic = { enable = false },
        assist = { importGranularity = 'module', importPrefix = 'self' },
        cargo = { allFeatures = true, loadOutDirsFromCheck = true },
        procMacro = { enable = true },
        checkOnSave = { allFeatures = true, command = 'clippy' },
      },
    },
  }
  end,
}
