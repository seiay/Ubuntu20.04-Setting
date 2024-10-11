local cmp = require'cmp'
local luasnip = require 'luasnip'

local map = cmp.mapping

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end


cmp.setup ({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
  },
  preselect = cmp.PreselectMode.None,
  mapping = map.preset.insert {
    ['<C-b>'] = map.scroll_docs(-4),
    ['<C-f>'] = map.scroll_docs(4),
   -- ['<C-Space>'] = map.complete(),
    ['<C-e>'] = map.abort(),
    ['<CR>'] = map.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = map(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = map(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
 -- source = cmp.config.sources({
 --   { name = 'nvim_lsp' },
 --   { name = 'luasnip' },
 --   --{ name = 'copilot' },
 --   { name = 'buffer' },
 --   { name = 'path' },
 -- })
  -- 24/7/13 mymemo: The way I wrote the above, I didn't get a candidate for completion
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
  --  property of completion become symbol.
--  formatting = {
--     format = require('lspkind').cmp_format {
--     mode = 'symbol',
--     preset = 'codicons',
--  }},
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'cmdline' },
  },
})
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    {
      name = 'buffer',
      option = {
        keyword_pattern = [[\k\+]],
      },
    },
  },
  formatting = {
    format = require('lspkind').cmp_format {
      mode = 'symbol',
      preset = 'codicons',
      symbol_map = { Copilot = '' },
    },
  },
})
--  Set up lspconfig.
-- set each capabilities at mason.lua (using mason-lspconfig)
--
--  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  --}
-- An example for configuring `clangd` LSP to use nvim-cmp as a completion engine
--require('lspconfig').clangd.setup {
--  capabilities = capabilities,
-- -- ...  -- other lspconfig configs
--}
--require('lspconfig').lua_ls.setup {
--  capabilities = capabilities,
-- -- ...  -- other lspconfig configs
--}
