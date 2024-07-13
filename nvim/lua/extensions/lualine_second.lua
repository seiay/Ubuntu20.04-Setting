-- onenord.nvim のカラーパレットを取得する
local colors = require('onenord.colors').load()

local switch_color = {
  -- mypink, mygray is original. You can custom these colors (edit extensions/onenord.lua).
  active = { fg = colors.active, bg = colors.mypink},
  inactive = { fg = colors.active, bg = colors.mygray},
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end


require('lualine').setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  globalstatus = true,
  -- sections is on the bottom of the window.
  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      {
        'filename',
        newfile_status = true,
        path = 1,
        shorting_target = 24,
        symbols = { modified = '_󰷥', readonly = '', newfile = '󰄛'},
      },
    },
    lualine_c = {
      {
      'diagnostics',
      sources = { 'nvim_diagnostic', 'nvim_lsp' },
      sections = { 'error', 'warn', 'info', 'hint' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
    { 'navic' },
    },

    lualine_x = {
      'encoding',
    },
    lualine_y = {
      { 'filetype', color = { fg = colors.fg } },
    },

    lualine_z = {
      { 'fileformat', icons_enabled = true, separator = { left = '', right = '' } },
    },
  },
  -- Tabline is on the top of the window.
  tabline = {
    lualine_a = {
      {
        'buffers',
        buffers_color = switch_color,
        symbols = { modified = '_󰷥', alternate_file = ' ', directory = ' ' },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {
      --'diff'
      { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' }, source = diff_source },
    },
    lualine_y = {
    --  'branch'
    { 'b:gitsigns_head', icon = { '', color = { fg = colors.orange } }, color = { fg = colors.fg } },
    },
    lualine_z = {
      { 'tabs', tabs_color = switch_color },
    },
  },
  -- WinBarていうものもあるらしい.
}

vim.api.nvim_set_option_value('showmode', false, {})
