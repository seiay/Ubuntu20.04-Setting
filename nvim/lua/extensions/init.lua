local plugins = {
  -- Visual
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },                                                 -- color scheme
  { "nvim-lualine/lualine.nvim", equires = { 'kyazdani42/nvim-web-devicons', opt = true } }, -- status line
  { "kyazdani42/nvim-web-devicons" },                                                       -- icons
  { "akinsho/bufferline.nvim" },                                                            -- buffer line

  -- completion
  { "hrsh7th/nvim-cmp" },        -- The completion plugin
  { "hrsh7th/cmp-buffer" },      -- buffer completions
  { "hrsh7th/cmp-path" },        -- path completions
  { "hrsh7th/cmp-cmdline" },     -- cmdline completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
 -- { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
 -- { "onsails/lspkind-nvim" },

  -- snippets
  --	{ "L3MON4D3/LuaSnip" }, --snippet engine

  -- LSP
  {
    'williamboman/mason.nvim',
    config = function() require 'extensions.mason' end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig', 'hrsh7th/cmp-nvim-lsp',
    }
  },
  { "jose-elias-alvarez/null-ls.nvim" },   -- formatters and linters
  { "glepnir/lspsaga.nvim" },              -- LSP UIs

  -- preview markdown
  {"asana17/prev-mark.nvim"},
 -- {"prev-mark", dir="~/work/prev-mark"}

  -- Formatter
  --{ "MunifTanjim/prettier.nvim" },

  -- Telescope (To use this plugin, you update neovim to the latest version,
  -- { "nvim-telescope/telescope.nvim" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter",
    config = function() require 'extensions.nvim-treesitter' end,
  },
  -- { "nvim-telescope/telescope-file-browser.nvim" },

  -- lualine
  { "nvim-lualine/lualine.nvim",
    config = function() require 'extensions.lualine_evil' end,
    --config = function() require 'extensions.lualine_second' end,
    dependencies = {  'nvim-tree/nvim-web-devicons' }
  },


  -- indent guide
  -- { "lukas-reineke/indent-blankline.nvim" },

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
--  if PACKER_BOOTSTRAP then
--    require("packer").sync()
--  end

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
