-- disable netrw at the very start of your init.lua (strongly advised) by nvim-tree.lua
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

local plugins = {
  -- Telescope (To use this plugin, you update neovim to the latest version,
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    config = function() require 'extensions.telescope' end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",
    config = function() require 'extensions.nvim-treesitter' end,
  },

  -- gitsigns
  { "lewis6991/gitsigns.nvim",
    config = function() require 'extensions.gitsigns' end, -- error occured
  },
  -- colorsheme : onenord
  { "rmehri01/onenord.nvim",
    config = function() require 'extensions.onenord' end,
  },
  -- lualine
  { "nvim-lualine/lualine.nvim",
--    config = function() require 'extensions.lualine_evil' end,
     config = function() require 'extensions.lualine_second' end,
    dependencies = {  'nvim-tree/nvim-web-devicons', 'rmehri01/onenord.nvim', 'lewis6991/gitsigns.nvim',
      'SmiteshP/nvim-navic',  'neovim/nvim-lspconfig',
    }
  },
  -- tree
  { "nvim-tree/nvim-tree.lua",
    config = function() require 'extensions.nvim-tree' end,
    dependencies = { 'nvim-tree/nvim-web-devicons' , 'nvim-telescope/telescope.nvim'},
  },
  -- nvim-hlslens
  {
    "kevinhwang91/nvim-hlslens",
    config = function() require 'extensions.nvim-hlslens' end,
  },
  -- nvim-scrollbar: 右側にスクロールバーが現れる.
  {
    'petertriho/nvim-scrollbar',
    config = function() require 'extensions.nvim-scrollbar' end,
    dependencies = {
      'kevinhwang91/nvim-hlslens', 'lewis6991/gitsigns.nvim',
    },
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function() require 'extensions.nvim-lspconfig' end,
  },
  {
    'williamboman/mason.nvim',
    config = function() require 'extensions.mason' end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp',
    }
  },
  {
    'SmiteshP/nvim-navic',
    config = function() require 'extensions.nvim-navic' end,
    dependencies = 'neovim/nvim-lspconfig',
  },
  {
    "SmiteshP/nvim-navbuddy",
    config = function() require 'extensions.nvim-navbuddy' end,
    dependencies = {
      'neovim/nvim-lspconfig', 'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim',
      'numToStr/Comment.nvim', 'nvim-telescope/telescope.nvim',
    },
  },
  -- completion
  { "hrsh7th/nvim-cmp",
    config = function() require 'extensions.nvim-cmp' end,
 --   config = function() require 'extensions.nvim-cmp_asana' end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim's built-in language server client.
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
      {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
        --  intstall jsregexp (optional!)
        --  build = 'make install_jsregexp',
        config = function() require 'extensions.luasnip' end,
        dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
      },
    }
  },
  {
  'j-hui/fidget.nvim',
  tag = "v1.0.0", -- Make sure to update this to something recent!
  config = function() require 'extensions.fidget' end,
  dependencies = 'neovim/nvim-lspconfig',
  },
  {
    'folke/trouble.nvim',
    config = function () require 'extensions.trouble' end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'rcarriga/nvim-notify',
    config = function () require 'extensions.nvim-notify' end,
  },
  {
  'nvimtools/none-ls.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
    config = true,
  },
  {
  'jay-babu/mason-null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'nvimtools/none-ls.nvim',
    },
    opts = {
      handlers = {}
    }
  },
  --{ "jose-elias-alvarez/null-ls.nvim" },   -- formatters and linters
  --{ "glepnir/lspsaga.nvim" },              -- LSP UIs
  -- indent guide
  {
    "lukas-reineke/indent-blankline.nvim" ,
    main = "ibl",
--    config = true,
    config = function () require 'extensions.indent-blankline' end,
  },

  -- preview markdown
  {"asana17/prev-mark.nvim"},

  -- local commit-msg-preview
  {
    "commitmsgpreview", dir = "~/commit-msg-preview.nvim/",
    dependencies = 'nvim-lua/plenary.nvim',
  },
  --diffview
  {
    "sindrets/diffview.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    --"supersaintex/super-commit.nvim",
    "super-commit", dir = "~/work/super-commit.nvim",
    config = function () require 'extensions.super-commit' end,
  },
}

-- vim.loader.enable()

local opts = {
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        --'matchparen',
        --'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
